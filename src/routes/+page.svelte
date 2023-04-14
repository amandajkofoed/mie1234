<script>
    import { Icon } from 'sveltestrap';
    function handleClick() {
        console.log('Icon clicked');
    }
</script>



<h1>Welcome to MIE</h1>

<p>This is going to be the homepage</p>

<div class="addneed">
    <h2>Add a new need <a href="/createneed"><Icon name="plus-square-fill" on:click={handleClick} /></a> </h2>

</div>

<!--<nav>
    <a href="/createneed">Create a need</a>
</nav>-->


<style>
    h1{
        margin-top: 20px;
    }
    a{
        color: black;
    }
    .addneed{
        background-color: white;
        height: 75px;
        width: 300px;
        background-position: center;
        color: black;
    }
</style>