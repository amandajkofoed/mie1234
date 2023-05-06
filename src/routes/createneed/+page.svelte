<script>
    import { Form, FormGroup, FormText, Input, Label, Button, Popover } from "sveltestrap";
    //import { PageData } from "./$types";
    //export let pagedata: PageData;
    import Header from "../../components/Header.svelte";



//From christian discord ---------------------------
    let files;
    let entitle
    let sendNeed = async () => {
        let file;

        if (files && files.length > 0) { //this is new
            file = files[0];
            // rest of the code that uses the file variable
            
            } else {
            console.error('No file selected');
        }
        //her henter jeg værdien af bruger input og definere det, så det er 'value' i formData.append()
        const needisInput = document.getElementById('speneed');
        const contactperInput = document.getElementById('addper');
        const fileContents = document.getElementById('examplefile');


        const formData = new FormData(); //nu kommer det der står efter kommaet til at være outputet, ligemeget hvad man udfylder i formen - LØST 
        formData.append('Title',entitle);
        formData.append('NeedIs', needisInput.value);
        formData.append('ContactPerson', contactperInput.value);
        formData.append('FileData', file)

        try {
            const response = await fetch('https://130.225.170.197/api/v1/needs/', {
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

<h1>Tilføj behov</h1>

<body>
    
    <h3>Her kan du oprette og dele et behov</h3>

    <Form id="form" enctype="multipart/form-data"> 
        <FormGroup>
            <Label for="Title">Emne/Titel</Label>
            <FormText color="muted"> <!--I dont like the gap between the title and the text-->
                <br> Navngiv din indsigt, f.eks.: "Kommunikation med patienter", "Afskaffelse af farligt affald" 
                    eller "Patienter keder sig når de venter"
            </FormText>
            <Input 
                type="text" 
                id="entitle" 
                name="entitle" 
                placeholder="f.eks. Patienter udebliver eller er forsinkede" 
                bind:value={entitle}
                
            />
        </FormGroup> <!---->
        
        <FormGroup> <!--How to make this a adjustble textarea?-->
            <Label for="addneed">Om afdelingens behov</Label>     
            
            <FormText color="muted"> <!--I dont like the gap between the title and the text-->
                <br> Her skal du beskrive et behov du har stødt på i dit arbejde på afdelingen. 
                    Fortæl om hvad behovet er og i hvilken kontekst det er opstået.
            </FormText>  

            <Input 
                type="textarea" 
                name="speneed" 
                id="speneed" 
                rows={3} 
                placeholder="Beskriv behovet"
                
            />
        </FormGroup> <!--Der skal linkes til et godt eksempel når det bliver lavet i. forhåbenligt på vores domæne. -->
        <!--<textarea name="speneed" id="speneed" rows="5" placeholder="Beskriv behovet"></textarea> -->

        <FormGroup>

            <Label for="conperson">Nøgleafdeling</Label>
            <FormText color="muted">
                <br> Hvilke afdeling man kan kontakte for at lære mere om netop dette behov, f.eks: HGH sengeafsnit for nyresyge.
            </FormText>
            <Input 
                type="text" 
                name="addper" 
                id="addper" 
                placeholder="f.eks. Hæmodialysen på Roskilde Universitetshospital"
                
            />
        </FormGroup> <!--bind:value={addper}-->

        <FormGroup>

            <Label for="proposal">Forslag</Label>
            <FormText color="muted">
                <br> Hvis du/I allerede har et forslag, så beskriv det her.
            </FormText>
            <Input 
                type="text" 
                name="addproposal" 
                id="addproposal" 
                rows={3} 
                placeholder="f.eks. Send besked til patienter dagen før"
                
            />
        </FormGroup>

        <FormGroup>

            <Label for="keywords">Nøgleord</Label>
            <FormText color="muted">
                <br> Indtast nøgleord (Nøgleordene skal adskilles med et komma (,))
            </FormText>
            <Input 
                type="text" 
                name="addkeywords" 
                id="addkeywords" 
                placeholder="f.eks. Patient, udeblivelse, SMS"
                
            />
        </FormGroup>

        <FormGroup>

            <Label for="solution">Løsning</Label>
            <FormText color="muted">
                <br> Beskriv den løsning du/I anvender
            </FormText>
            <Input 
                type="text" 
                name="addsolution" 
                id="addsolution" 
                rows={3} 
                placeholder="f.eks. Vi ringer vores patienter op dagen før"
                
            />
        </FormGroup>
         
        <FormGroup > <!--https://sveltestrap.js.org/?path=/story/components--inputs--> <!--nu kan man vælge billeder filer og PDF-->
        
            <Label for="examlpefile">Tilføj dokumenter eller billeder</Label>
            <FormText color="muted">
                <br> Her kan du tilføje dokumentation om behovet, f.eks.: forskningsresultater, en email, 
                    billeder af situationer eller en afsluttende opgave.
            </FormText>
            <Input 
                type="file"   
                name="myfile" 
                id="examplefile"
                accept="image/*, application/pdf"
                bind:files

            />
        </FormGroup> <!--This is not getting posted, check why, bind:value={examplefile}, on:change={handleFileUpload}-->
        <!--gør det muligt at downloade the uploadede fil/billede og gør alle filer mulige at uploade.-->

        <Button size="lg" type="submit" value="Submit" name="mySubmit" on:click={sendNeed}>Del behov</Button>
    </Form> <!--on:click={handleSubmit}-->
</body>



<style>
   h1{
    margin-top: 20px;

   }
   body{
        line-height: 1.5;
        margin-top: 20px;
        background-color: white;
        border-radius: 20px;
        padding: 15px;
    }

    
</style>