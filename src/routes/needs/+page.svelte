<script>
    import { each } from "svelte/internal"; //Chat GPT: no need to import it, it is built in
    
    let Title
    let NeedIs;
    let ContactPerson;
    let FileData;

    let id //mulighed: at bruger kan indskrive ID nummer 


    let needs;

//------------code to extract the file name-------------------------virker ikke
    //const atfileURL = "<a href=\"http://130.225.170.197/api/v1/download/43\">GroupProjectRequirements2023 (7).pdf</a>";
    //const start = atfileURL.lastIndexOf('/') + 1;
    //const end = atfileURL.lastIndexOf('">');
    //const atFileName = atfileURL.substring(start, end); 

    //console.log(atFileName);
//------------------------------


    let fetchData = async ()=>{
        const res = await fetch("http://130.225.170.197/api/v1/needs/30");
        //const data = await res.json();
        //console.log(data);
        //return data;
        return await res.json()
        }; /*This only fetches data, if it is setup as an array, and it is not */

    
    //---------added 18/4 from chat gpt-----------
    let loadNeeds = async() => {
        //needs = await fetchData();
        const response = await fetchData();
        //console.log(response)
        Title = response.body.Title;
        NeedIs = response.body.NeedIs;
        ContactPerson = response.body.ContactPerson;
        FileData = response.body.fileURL; //Now the URL from line 13 is being shown and the name of the file. if no file = null
    }   

    loadNeeds();

    const handleClick = async () => {
    await loadNeeds();
    }

    //---------------------------------------
    
    /*let fetchData = async () => {
        const res = await fetch("http://130.225.170.197/api/v1/needs/14");
        const data = await res.json();
        console.log(data);
        return data;
    };*/ /*This was to check if it was an array = it is not */
    
    //let needs = fetchData() //18/4

</script>

<h1>View needs</h1>

<body> <!--18/4: 'data' is being changed to 'json'-->
    <p>Here you can view needs</p>
    <!--{#await needs}
        <p>...waiting</p>
    {:then json} <!-before: :then data
    {#if Array.isArray(json)}
            <ol>
                {#each json as need}
                    <li>
                        {JSON.stringify(Title)} - {need.NeedIs} - {need.ContactPerson} <!-is this correct?
                    </li>
                {/each}
            </ol>

        {:else if (typeof json === 'object' && json !== null)} <!-new from here
            <ol>
                {#each Array.from(json) as need}
                    <li>
                        {JSON.stringify(need)}
                    </li>
                {/each}
            </ol> <!-new to here

        {:else}
        <p>The data is not an array or an array like object</p>
    {/if}

    {:catch error}
        <p style="color: red">{error.message}</p>
    {/await}--> 
    
    <p>Enter ID:</p>
    <input type="number" bind:value={id} placeholder="Enter ID" />
    <button on:click={loadNeeds}>Load Needs</button>

    <!--------------------added 21/4-23-------------->
    <h2>Title: {Title}</h2>
    <h3>Need</h3>
    <p class="needarea">{NeedIs}</p>
    <h3>Contact Person</h3>
    <p> {ContactPerson}</p>
    <h3>File(s)</h3>
    <p> {@html FileData}</p> 
    
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



<!--det er en fil med buffer, undersøg det -->