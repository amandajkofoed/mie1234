<script>
    import { Nav, NavItem, NavLink, Form, FormGroup, FormText, Input, Label } from 'sveltestrap';

    //--------trying from Chat gpt 
    let searchResults = [];

    function search() {
        console.log('searching...');
        const query = document.getElementById('exampleSearch').value;
        console.log('query:', query)
        fetch(`http://130.225.170.197/api/v1/search?keyword=${query}&pageNumber=1&resultsPerPage=10`)
            .then(response => response.json())
            .then(data => {
                console.log(data)
                searchResults = data;
                console.log('searchResults:', searchResults)
            });
    }


    function redirectToPage(result) {
        window.location.href = '/seeSearchResults/' + result
    }

   
    
</script>

<!--https://www.w3schools.com/howto/howto_css_searchbar.asp-->
<header>
    <div class="topheader">
        <a href="/">
            <h1>MIE</h1>
        </a>
        <Nav pills class="navpills"> <!--kan man få den 'korrekte' tab til at være farvet?--> <!--https://sveltestrap.js.org/?path=/story/components--nav-->
            <NavItem>
                <NavLink href="/">Hjem</NavLink>
            </NavItem>
            <NavItem>
                <NavLink href="/needs">Behov</NavLink>
            </NavItem>
            <NavItem>
                <NavLink href="/allneeds">Se alle behov</NavLink>
            </NavItem>
            <NavItem>
                <NavLink href="/register">Registre dig</NavLink>
            </NavItem>
            <NavItem>
                <NavLink href="/seeSearchResults/[id]">Søg i behov</NavLink>
            </NavItem>
        </Nav>
        <!-- svelte-ignore missing-declaration -->
        
        
        
        <!--<input type="text" placeholder="Search needs">-->
    </div>
    <!--<div>
        {#if searchResults && searchResults.length > 0}
        <ul>
            {#each searchResults as result}
                <li on:click={() => redirectToPage(result)} on:keydown={(event) => 
                {if (event.key === 'Enter') redirectToPage(result)}}> {result.Title} - {result.NeedIs} 
                </li>
            {/each}
        </ul>
    {/if}
    </div>-->


   
</header>



    

<style>
    header{
        background: #ffffff;
        padding: 20px;
        margin-top: auto;
        margin-bottom: auto;
    }
    .topheader h1{
        float: left;
        color: black;
        text-align: center;
        font-weight: bold;
        font-size: 60px;
        
    }
    /*.topheader input[type=text]{
        float: right;
        padding: 6px;
        border: none;
        margin-right: 16px;
        font-size: 15px;
        width: 200px;
    }*/

    .topheader{
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

</style>