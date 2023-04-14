<script>
    import { each } from "svelte/internal";

    let fetchData = async ()=>{
        const res = await fetch("http://130.225.170.197/api/v1/needs/8");
        return await res.json()
        }
    let needs =fetchData()

</script>

<h1>View needs</h1>

<body>
    <p>Here you can view needs</p>
    {#await needs}
        <p>...waiting</p>
    {:then data}
    <ol>
        {#each data as adress}
            <li>
                {JSON.stringify(adress.adressebetegnelse)} - {adress.etage}
            </li>
        {/each}
    </ol>
    {:catch error}
        <p style="color: red">{error.message}</p>
    {/await}
    
</body>

<style>
    h1{
        margin-top: 20px;
    }
</style>