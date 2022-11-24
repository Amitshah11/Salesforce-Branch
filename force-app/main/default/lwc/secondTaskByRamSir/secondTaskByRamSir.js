import { LightningElement, wire, track } from 'lwc';
import oppList from '@salesforce/apex/SecondTaskByRamSir.oppList';
import sortByStage from '@salesforce/apex/SecondTaskByRamSir.sortByStage';
import StageList from '@salesforce/apex/SecondTaskByRamSir.StageList';
import deleteOpp from '@salesforce/apex/SecondTaskByRamSir.deleteOpp';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import changeTheStage from '@salesforce/apex/SecondTaskByRamSir.changeTheStage';




export default class SecondTaskByRamSir extends LightningElement {

    @track alldata = [];
    @track options = [];
    @track selectedValue = [];
    @track dropclick = false;
    @track allselect=false;
@track editrow=false;
@track recordId;
@track viewrecord=false;
@track changestage=false;
@track stageOptions=[];
@track newStage;
@track samestageornot;
@track isLoaded=false;
@track previousstage;
// Get all data from org
@wire(oppList)
showAll({ data, error }) {
    if (data) {
        this.alldata = JSON.parse(JSON.stringify(data));
    }
    else if (error) {
        window.alert("ERROR");
    }
}

//Click on drop down icon
    dropClick() {
        this.allselect=false;
        this.dropclick = true;
        this.selectedValue = [];
    }

//Getting selected stage record
    @wire(StageList)
    stage({ data, error }) {
        if (data) {
            this.options = data;
            
            let alloptions=[];
            this.options.forEach(all=>{
            alloptions.push(
                { value:all, label:all}
                ); 
            });
            this.stageOptions= JSON.parse(JSON.stringify(alloptions));

        }
        else if (error) {
            window.alert("No data in StageName");
        }
    }

// On submit button
    Submit() {
        this.dropclick = false;
        if(this.selectedValue.length==0){
            oppList().then((res) => {
                this.alldata = res;
            });
        }
        else{
            sortByStage({ stage: this.selectedValue })
                .then((result) => {
                this.alldata = result;
            });
        }
    }

// On cancel button
    Cancel() {
        this.dropclick = false;
    }

// Changing checkboxes
    checkboxchange(event) {
        let nam = event.target.name;
        console.log("name" + nam)
        if (nam == "All stages") {
            if(event.target.checked){
                this.selectedValue=[];
                this.allselect=true;
                this.options.forEach(stage =>{
                    this.selectedValue.push(stage); 
                });
            }
            else{
                this.allselect=false;
                this.options.forEach(stage =>{
                    this.selectedValue = this.selectedValue.filter(item => item != stage);
                });
            }
            console.log(' Inside in checked all : > '+this.selectedValue);
        }

        if(nam !='All stages'){
            if (event.target.checked) {
                this.selectedValue.push(nam);
                console.log("all selected items   : " + this.selectedValue);
            }
            else {
                this.selectedValue = this.selectedValue.filter(item => item!= nam);
                console.log("all selected items   : " + this.selectedValue);
            }
        }
    }

    onsave(){
        this.editrow=false;
 this.isLoaded=true;
 setTimeout(() => {
    this.isLoaded=false;

    this.refreshApex(this.alldata);

 }, 1000);

    }

     oncancel(){
        this.editrow=false;
        this.viewrecord=false;
        this.changestage=false;
     }

     onok(){
          console.log(' inside in onok function ');      
        this.changestage=false;
        console.log(this.newStage);
        changeTheStage({opid:this.recordId,stage:this.newStage}).then(result=>{
            console.log(' inside in return --> '+result);
            if(result == true){ 
                this.alldata.forEach((data, index) =>{
                    if(data.Id == this.recordId)
                    {
                        console.log(' Inside in same ID '+this.newStage+' --> '+ data.StageName);
                        data.StageName = this.newStage;
                    }
                })  
                const evt = new ShowToastEvent({
                    title: 'Toast Success',
                    message: 'Stage name changed sucessful',
                    variant: 'success',
                    mode: 'dismissable'
                });
                this.dispatchEvent(evt);
            }else{
                const evnt = new ShowToastEvent({
                    title: 'Toast Success',
                    message: 'Stage name was same',
                    variant: 'error',
                    mode: 'dismissable'
                });
                this.dispatchEvent(evnt);
            }
            
        }); 
     }

     newStagechange(event){
        this.newStage=event.detail.value;
     }

     ChangeMenuIcon(event){
        try{
            console.log(' insie in ChangeMenuIcon');
            const selectedItemValue = event.detail.value;
            this.recordId = event.target.name;
            this.previousstage=event.target.value;

            console.log('Selected values --> '+selectedItemValue+ 'Record Id --> '+this.recordId);
            if(selectedItemValue == 'Edit'){
                console.log(' Inside in Edit -->');

                this.editrow=true;

            }else if(selectedItemValue == 'Delete'){
                console.log(' Inside in Delete >');

                deleteOpp({oppid:this.recordId}).then(()=>{
                
                    const event = new ShowToastEvent({
                        title: 'Opportunity deleted',
                        message: 'Opportunity deleted',
                        variant: 'success',
                    });
                    this.dispatchEvent(event);
                    this.refreshApex(this.alldata);

            });
        }
        else if(selectedItemValue == 'View'){
            this.viewrecord=true;
    }
    else if(selectedItemValue == 'Change stage'){
        this.changestage=true;
}

        }catch(error){
            console.log('error in ChangeMenuIcon '+error);
        }
     }
}