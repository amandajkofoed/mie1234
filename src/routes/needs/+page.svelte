<script>
    import { each } from "svelte/internal";
    
    /*let entitle
    let speneed;
    let addper;
    let examplefile;*/


    let fetchData = async ()=>{
        const res = await fetch("http://130.225.170.197/api/v1/needs/10");
        return await res.json()
        };
    
    let needs = [fetchData()]

</script>

<h1>View needs</h1>

<body>
    <p>Here you can view needs</p>
    {#await needs}
        <p>...waiting</p>
    {:then data} <!--before: :then data-->
    {#if Array.isArray(data)}
            <ol>
                {#each data as need}
                    <li>
                        {JSON.stringify(need)} <!-- - {needs.NeedIs}-->
                    </li>
                {/each}
            </ol>
        {:else}
        <p>The data is not an array</p>
    {/if}

    {:catch error}
        <p style="color: red">{error.message}</p>
    {/await}
    
</body>

<style>
    h1{
        margin-top: 20px;
    }
</style>



<!--det er en fil med buffer, undersøg det -->