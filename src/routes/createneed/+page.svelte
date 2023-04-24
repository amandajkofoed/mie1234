<script>
    import { Form, FormGroup, FormText, Input, Label, Button, Popover } from "sveltestrap";
    //import { PageData } from "./$types";
    //export let pagedata: PageData;
    import Header from "../../components/Header.svelte";

//---------------------https://refine.dev/blog/how-to-multipart-upload/---------------------
    /*const form = document.getElementById("form");
    const inputFile = document.getElementById("examplefile")
    
    const formData = new FormData();

    const handleSubmit = (event) => {
        event.preventDefault();

        for (const file of inputFile.files){
            formData.append('Title', createNeedForm.querySelector('input[name="entitel"]').value);
            formData.append('NeedIs', createNeedForm.querySelector('input[name="speneed"]').value);
            formData.append('ContactPerson', createNeedForm.querySelector('input[name="addper"]').value);
            formData.append('FileData', createNeedForm.querySelector('input["examplefile"]').value);
        }

        fetch("http://130.225.170.197/api/v1/needs", {
            method: "post",
            body: formData
        }).catch((error)=> ("noget gik galt", error));
    }
    
    form.addEventListener("submit", handleSubmit);*/
//---------------------------------------------------------

//------------CHATGPT------------------
    /*async function doSubmit(event) {
        event.preventDefault();

        const formData = new FormData()
        const fileInput = event.target.querySelector('input[type=file]');

        if (fileInput.files.length > 0) {
            formData.append('myfile', fileInput.files[0]);

            const response = await post('http://130.225.170.197/api/v1/needs', {body: formData});

            console.log(response.status);
        }
    }*/
//-----------------------------------------------------------------


//-----------------From christians example---------------------------
    /*let entitle;
    let speneed;
    let addper;
    let examplefile;
    

    let sendNeed = async()=>{
        try {
        res = await fetch("http://130.225.170.197/api/v1/needs",{
            method:"POST",
            headers: {
                "Content-Type" : "application/json" /*check link from arooj
                //"Content-Type" : "multipart/form-data" - this causes error 500
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
        alert("Vi sendte data!") //måske: anvend alert fra sveltestrap istedet
    }*/

//-------------------https://hartenfeller.dev/blog/sveltekit-image-upload-store---------------------
    /* function handleFileUpload(e: Event){
        const image = (e.target as HTMLInputElement)?.files?.[0];
    } this was used: */ /* issue with ts and js*/
//----------------------------------

//From christian discord ---------------------------
    let sendNeed = async (event) => {
        const files = event.target.files;

        if (files && files.length > 0) { //this is new
            const file = files[0];
            // rest of the code that uses the file variable
            } else {
            console.error('No file selected');
        }
        //her henter jeg værdien af bruger input og definere det, så det er 'value' i formData.append()
        const titleInput = document.getElementById('entitle');
        const needisInput = document.getElementById('speneed');
        const contactperInput = document.getElementById('addper');
        const filedataInput = document.getElementById('examplefile');


        const formData = new FormData(); //nu kommer det der står efter kommaet til at være outputet, ligemeget hvad man udfylder i formen - LØST 
        formData.append('Title',titleInput.value);
        formData.append('NeedIs', needisInput.value);
        formData.append('ContactPerson', contactperInput.value);
        formData.append('FileData', filedataInput.value); //stadig problemer med at tilføje fil, 
        //formData.append('FileData', file);

        try {
            const response = await fetch('http://130.225.170.197/api/v1/needs', {
                method: 'POST',
                body: formData
            });

            if (response.ok) {
                const json = await response.json();
                console.log('Need ID:', json.id);

            } else {
                console.error('Error:', response.statusText);
            }
        } catch (error) {
            console.error('Error:', error);
        }
    }


</script>

<h1>Add a need</h1>

<body>
    
    <h3>Here you can create a need</h3>

    <Form id="form" enctype="multipart/form-data"> 
        <FormGroup>
            <Label for="Title">Enter a title</Label>
            <FormText color="muted"> <!--I dont like the gap between the title and the text-->
                <br> The MIE pilot aim to provide the documentation for value creation and applicability 
                necessary to back a funding application to the Novo Nordisk Foundation.
            </FormText>
            <Input 
                type="text" 
                id="entitle" 
                name="entitle" 
                placeholder="fx. Patienter udebliver eller er forsinkede" 
                
            />
        </FormGroup> <!--bind:value={entitle}-->
        
        <FormGroup> <!--How to make this a adjustble textarea?-->
            <Label for="addneed">Specify the need</Label>     
            
            <FormText color="muted"> <!--I dont like the gap between the title and the text-->
                <br> The MIE pilot aim to provide the documentation for value creation and applicability 
                necessary to back a funding application to the Novo Nordisk Foundation.
            </FormText>  

            <Input 
                type="textarea" 
                name="speneed" 
                id="speneed" 
                rows={3} 
                placeholder="Beskriv behovet"
                
            />
        </FormGroup> <!--bind:value={speneed}-->
        <!--<textarea name="speneed" id="speneed" rows="5" placeholder="Beskriv behovet"></textarea> -->

        <FormGroup>

            <Label for="conperson">Enter the name and email of the contact person</Label>
            <Input 
                type="text" 
                name="addper" 
                id="addper" 
                placeholder="fx. Amanda Kofoed, amanda@mandu.dk, DTU" 
                
            />
        </FormGroup> <!--bind:value={addper}-->
         
        <FormGroup > <!--https://sveltestrap.js.org/?path=/story/components--inputs--> <!--nu kan man vælge billeder filer og PDF-->
        
            <Label for="examlpefile">File</Label>
            <Input 
                type="file"   
                name="myfile" 
                id="examplefile"
                accept="image/*, application/pdf"

            />
        </FormGroup> <!--This is not getting posted, check why, bind:value={examplefile}, on:change={handleFileUpload}-->
        <!--gør det muligt at downloade the uploadede fil/billede og gør alle filer mulige at uploade.-->

        <Button size="lg" type="submit" value="Submit" name="mySubmit" on:click={sendNeed}>Submit</Button>
    </Form> <!--on:click={handleSubmit}-->
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