<script>
    import { Icon, Button } from 'sveltestrap';
    function handleClick() {
        console.log('Icon clicked');
    }

</script>


<main>
    <h1>Velkommen til MIE – Mapping Innovation Ecology</h1>


    <body>
        <p>MIE er for sundhedsprofessionelle og studerende som arbejder med forbedringstiltag i sundhedsvæsenet.</p>
        <p>Her kan du dele behov, ideer, muligheder, ting du har prøvet og udfordringer, som nogen burde gøre noget ved.</p>
        <p>Du kan registrere  alt fra små behov i fra dagligdagen, forskningsprojekter og projekter af alle slags ind i mellem, 
            uanset modenhed. Du kan også registrere behov, hvor løsningen er implementeret. Intet er for småt og intet er for stort.</p> 
        <p>Husk at andre studerende og sundhedsfaglige kan læse dit opslag.</p> 
            

        <div class="addneed">
            <!--<h3><a href="/createneed"><Icon name="plus-square-fill" on:click={handleClick} /></a> Tilføj et behov </h3>-->
            <Button style="background-color: lightblue;" size="lg"  href="/createneed" on:click={handleClick}>
                <h3> <Icon name="plus-square-fill"/> Tilføj et behov </h3>
            </Button>
        </div>

        <div class="kontaktCai">
            <p>Har du spørgsmål, brug for at rette eller slette dit opslag, 
                skriv til Cailín på s191779@dtu.dk.</p>
        </div>
    </body>
</main>
<!--<-->

<!--<nav>
    <a href="/createneed">Create a need</a>
</nav>-->


<style>
    body{
        background-color: white;
        border-radius: 20px;
        padding: 15px;
    }
    h1{
        margin-top: 20px;
    }
    h3{
        color: black;
    }
    .addneed{
        padding-top: 70px;
        /*height: 75px;
        width: 300px;*/
        color: black;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    /*.addneed h3{
        
        padding: 10px;

    }*/

    .kontaktCai{
        padding-top: 120px;
    }
</style>