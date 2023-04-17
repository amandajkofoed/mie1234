<script>
    import { Form, FormGroup, FormText, Input, Label, Button } from "sveltestrap";
    
    let entitle;
    let speneed;
    let addper;
    let examplefile;

    let sendNeed = async()=>{
        try {
        res = await fetch("http://130.225.170.197/api/v1/needs",{
            method:"POST",
            headers: {
                "Content-Type" : "application/json"
            },
            body: JSON.stringify({
                Title:entitle,
                NeedIs:speneed,
                ContactPerson:addper,
                FileData:examplefile
            })
        })
    } catch {
        //Gør noget ved fejl
    }
        alert("Vi sendte data!")
    }
</script>

<h1>Add a need</h1>

<body>
    
    <h3>Here you can create a need</h3>

    <Form> 
        <FormGroup>
            <Label for="Title">Enter a title</Label>
            <Input 
                type="text" 
                id="entitle" 
                name="entitle" 
                placeholder="fx. Patienter udebliver eller er forsinkede" 
                bind:value={entitle}
            />
        </FormGroup>
        
        <FormGroup> <!--How to make this a adjustble textarea?-->
            <Label for="addneed">Specify the need</Label>            
            <Input 
                type="textarea" 
                name="speneed" 
                id="speneed" 
                rows={3} 
                placeholder="Beskriv behovet"
                bind:value={speneed}
            />
        </FormGroup>
        <!--<textarea name="speneed" id="speneed" rows="5" placeholder="Beskriv behovet"></textarea> -->

        <FormGroup>
            <Label for="conperson">Enter the name and email of the contact person</Label>
            <Input 
                type="text" 
                name="addper" 
                id="addper" 
                placeholder="fx. Amanda Kofoed, amanda@mandu.dk, DTU" 
                bind:value={addper}
            />
        </FormGroup> <!--says addper is not declared: bind:value={addper}-->
         
        <FormGroup> <!--https://sveltestrap.js.org/?path=/story/components--inputs--> <!--denne blev ikke uploaded, find ud af hvordan, (pdf, png, jpeg)-->
            <Label for="examlpefile">File</Label>
            <Input 
                type="file"   
                name="file" 
                id="examplefile"
            />
        </FormGroup> <!--This is not getting posted, check why-->

        <Button size="lg" type="submit" value="Submit" on:click={sendNeed}>Submit</Button>
    </Form>
</body>



<style>
   h1{
    margin-top: 20px;

   }
   body{
        line-height: 1.5;
        margin-top: 20px;
    }
    /*form label, form input{
        display: block;
    }
    form input{
        margin-bottom: 15px;
    }
    /*form textarea{
        margin-bottom: 15px;
    }
    form label{
        font-weight: bold;
    }
    /*#speneed{
        width: 1000px;
        height: 100px;
    }

    #entitle, #addper{
        width: 500px;
    }*/
</style>