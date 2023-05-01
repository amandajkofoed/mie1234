<script>
    import { Form, Button } from "sveltestrap";

    export const actions = {
        logOut: async() => {
            const response = await fetch("http://130.225.170.197/api/v1/logout", {
                method: 'post', 
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${localStorage.getItem('token')}`
                }
            });
            if (response.ok) {
                localStorage.removeItem('token')
                window.location.href = '/login/'
            }
        }
    }
</script>


<footer>
    <div class="mie"> 
        <span> <b>MIE</b></span>
        About-MIE
        FAQ
        Contact-us
        <Button style="background-color: lightblue" type="logout" value="Logout" name="logOut" on:click={actions.logOut} >Log ud</Button>
    </div>
    
</footer>

<style>
    footer{
        text-align: center;
        background: white;
        /*margin-top: auto; 
        margin-bottom: auto;*/
        /*position: fixed;*/
        left: 0;
        bottom: 0;
        width: 100%; 
        padding: 20px;
    }
    .mie{
        color:black;
        word-spacing: 30px;
        font-size: 15px;
        text-align: center;

    }
    .mie span{
        color: yellow;
        font-size: 35px;
        padding: 10px;
    }

    
    
    
</style>