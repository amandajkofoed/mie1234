<script>
    import { Form, FormGroup, FormText, Input, Label, Button, Popover } from "sveltestrap";

    let email = '';
    let password = '';
    let token ='';


    
async function login() {
    try {
        const response = await fetch('https://130.225.170.197/api/v1/login', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            email, password
        }),
        });

        if (!response.ok) {
        throw new Error('Login failed');
        }

        const data = await response.json();
        token = data.token;
        localStorage.setItem('token', token);

        // Redirect to home page
        window.location.href = '/';
    } catch (error) {
        console.error(error);
        // Handle error
    }
    }







   
   
</script>

<h1>Her kan du logge ind på MIE</h1>

<body>
    <Form>
        <FormGroup>
            <Label for="enteremail">Indtast din email</Label>
            <Input 
            type="email" 
            id="enteremail" 
            name="email" 
            placeholder="Indtast den email du valgte, da du registrede dig" 
            bind:value={email}
            />
        </FormGroup>

        <FormGroup>
            <Label for="enterpassword">Indtast dit kodeord</Label>
            <Input 
            type="password" 
            id="enterpassword" 
            name="password" 
            placeholder="Indtast den kode du valgte, da du registrerede dig" 
            bind:value={password}
            />
        </FormGroup>

        <Button size="lg" type="submit" value="Submit" name="mySubmit" on:click={login}>Log ind</Button>

    </Form>
</body>

<style>
    body{
        line-height: 1.5;
        margin-top: 20px;
        background-color: white;
        border-radius: 20px;
        padding: 15px;
    }
</style>