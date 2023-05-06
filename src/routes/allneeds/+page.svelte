<script>
    let Title
    let NeedIs;
    let ContactPerson;
    let FileData;

    let needs = [];
    let token ='';

    let fetchData = async ()=>{
        const res = await fetch("https://130.225.170.197/api/v1/allneeds");
        const data = await res.json();
        //console.log(data);
        return data;
        return await res.json()
        }; /*This only fetches data, if it is setup as an array, and it is not */


    let loadAllNeeds = async() => {
         const response = await fetchData();
         needs = response.body;
         //added later 
         needs.forEach(need => {
             need.FileData = need.fileURL.split('\">')[1].split("</a>")[0];
             need.fileURL = need.fileURL.split('href=\"')[1].split('\">')[0];
         })
     }


   loadAllNeeds();
</script>

<h1>Her kan du se alle behov som er blevet delt/oprettet</h1>

<body>
    {#each needs as need }
        <h2>Title: {need.Title}</h2>
        <h3>Need</h3>
        <p class="needarea">{need.NeedIs}</p>
        <h3>Contact Person</h3>
        <p> {need.ContactPerson}</p>
        {#if need.fileURL}
            <h3>File(s)</h3>
            <p> <a href="{need.fileURL}"> {need.FileData} </a> </p>
        {/if}
    {/each}
    
</body>

<style>
    body{
        background-color: white;
        border-radius: 20px;
        padding: 15px;
    }
    h1{
        margin-top: 20px;
    }

    h2{
        margin-top: 10px;
        margin-bottom: 10px;
        padding-bottom: 10px;
        border-bottom-style: solid;
    }

    .needarea{
        border-style: dashed;
    }
</style>



<!--API = http://130.225.170.197/api/v1/allneeds-->