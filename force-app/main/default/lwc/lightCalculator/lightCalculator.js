import { LightningElement,track,wire } from 'lwc';
import accountTable from '@salesforce/apex/WireClassCal.accountTable';
import {updateRecord} from 'lightning/uiRecordApi';

const columns=[
{label:'ID',fieldName:'Id',editable:true},
{label:'Name',fieldName:'Name', editable:true}
];

export default class LightCalculator extends LightningElement {


result=0;
num1;
num2;

@track bothNum={input1:"",input2:""}

num1handler(event){
this.num1=event.target.value;
this.bothNum.input1=event.target.value;
}

num2handler(event){
this.num2=event.target.value;
this.bothNum.input2=event.target.value;

}

handleAdd(){
this.result=parseInt(this.num1)+parseInt(this.num2);
}

handleSub(){
this.result=parseInt(this.num1)-parseInt(this.num2);
}

handleMul(){
this.result=parseInt(this.num1)*parseInt(this.num2);
}

handleDiv(){
this.result=parseInt(this.num1)/parseInt(this.num2);
}


@track columns=columns;
@track data=[];
@wire(accountTable)
printAccdata({data,error}){
if(data){
this.data=data;
}
else if(error){
    window.alert("Error");
}
}

number=0;
Add1(){
this.number++;

}
Subtract1(){
this.number--;
}


handleSave(event) {
    this.saveDraftValues = event.detail.draftValues;
    const recordInputs = this.saveDraftValues.slice().map(draft => {
        const fields = Object.assign({}, draft);
        return { fields };
    });

    // Updateing the records using the UiRecordAPi
    const promises = recordInputs.map(recordInput => updateRecord(recordInput));
    Promise.all(promises).then(res => {
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: 'Records Updated Successfully!!',
                variant: 'success'
            })
        );
        this.saveDraftValues = [];
        return this.refresh();
    }).catch(error => {
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Error',
                message: 'An Error Occured!!',
                variant: 'error'
            })
        );
    }).finally(() => {
        this.saveDraftValues = [];
    });
}
}