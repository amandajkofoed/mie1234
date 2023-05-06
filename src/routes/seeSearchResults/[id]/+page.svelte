<!--sveltekit docs -> routes parameters, loading data - layout  -->
<script>
   

  import { Nav, NavItem, NavLink, Form, FormGroup, FormText, Input, Label } from 'sveltestrap';


  let searchResults = [];

    function search() {
        console.log('searching...');
        const query = document.getElementById('exampleSearch').value;
        console.log('query:', query)
        fetch(`https://130.225.170.197/api/v1/search?keyword=${query}&pageNumber=1&resultsPerPage=10`)
            .then(response => response.json())
            .then(data => {
                console.log(data)
                searchResults = data;
                console.log('searchResults:', searchResults)
            });
    }
</script>

<h1>Her kan du søge i alle behovene</h1>
<body>
    <Form>
        <FormGroup>
            <Label for="searchKeyWords"></Label>
                <Input
                type="search"
                name="search"
                id="exampleSearch"
                placeholder="Søg nøgleord"
                on:input={search}
                />
        </FormGroup>
    </Form>



    <div>
        <ul>
          {#each searchResults as result}
            <li>
              <h2>{result.Title}</h2>
              <p>{result.NeedIs}</p>
              <p>{result.ContactPerson}</p>
              <p>{result.CreatedAt}</p>
              <a href={result.fileURL}>Download</a>
            </li>
          {/each}
        </ul>
      </div>
</body>

<style>
    body{
        background-color: white;
        border-radius: 20px;
        padding: 15px;
    }
</style>





<!--THIS NEEDS TO BE DONE-->