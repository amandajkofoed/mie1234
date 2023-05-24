<script>
    import { Alert } from 'sveltestrap';
    import { Form, FormGroup, FormText, Input, Label, Button, Popover } from "sveltestrap";

    
    let name = '';
    let email = '';
    let password = '';
    let organization = '';
    let department = '';
    let profession = '';

    async function register() {
        const response = await fetch('https://www.innocloud.dk/api/v1/register', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                name, email, password, organization, department, profession }),
        })
        const validEmailDomains = ["dtu.dk", "regionh.dk"];
        const emailDomain = email.split("@")[1];
        if (!validEmailDomains.includes(emailDomain)) {
            alert("Din email skal være en dtu eller region H email");
            return;
        }

            if (response.ok) {
                window.location.href = '/login/'
            } else {
                alert("Der skete en fejl, du er ikke registreret")
            }
        }
    
</script>

<h1>Her kan du registre dig til MIE</h1>

<body>
    <Form>
        <FormGroup>
            <Label for="fullname">Indtast fulde navn</Label>
            <Input 
            type="text" 
            id="fullname" 
            name="name" 
            placeholder="Indtast fulde navn, f.eks. Morten Mortensen" 
            bind:value={name}
            />
        </FormGroup>

        <FormGroup> <!--find ud af hvordan, men kun 2 typer mail er tilladte: @dtu.dk og @regionh.dk-->
            <Label for="enteremail">Indtast email</Label>
            <Input 
            type="email" 
            id="enteremail" 
            name="email" 
            placeholder="Indtast email, f.eks. s123456@dtu.dk" 
            bind:value={email}
            />
        </FormGroup>

        <FormGroup>
            <Label for="enterpassword">Indtast et kodeord</Label>
            <Input 
            type="password" 
            id="enterpassword" 
            name="password" 
            placeholder="Indtast et kodeord du kan huske" 
            bind:value={password}
            />
        </FormGroup>

        <FormGroup>
            <Label for="enterordanization">Vælg organisation</Label>
            <FormText color="muted">
                Vælg den orgisation du hører til
              </FormText>
            <Input 
            type="select" 
            id="enterordanization" 
            name="organization" 
            bind:value={organization}>
            <option>Universitet</option>
            <option>Hospital</option>
            </Input>
        </FormGroup>

        <FormGroup>
            <Label for="enterdepartment">Indtast den afdeling du hører til</Label>
            <Input 
            type="textarea" 
            name="department" 
            id="enterdepartment" 
            placeholder="Indtast afdeling, f.eks. DTU ballerup"
            bind:value={department}
            />
          </FormGroup>

          <FormGroup>
            <Label for="enterprofession">Vælg din profession</Label>
            <FormText color="muted">
                Vælg din profession
              </FormText>
            <Input 
            type="select" 
            id="enterprofession" 
            name="profession" 
            bind:value={profession}>
            <option>Sundhedsprofessionel</option>
            <option>Studerende</option>
            </Input>
        </FormGroup>
        
        <Button size="lg" type="submit" value="Submit" name="mySubmit" on:click={register}>Registrer</Button>

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