import { LightningElement ,wire} from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import {updateRecord} from 'lightning/uiRecordApi';





const columns=[
    {label:'ID', fieldName:'Id', editable:true},
    {label:'Name', fieldName:'Name', editable:true}
    ];

export default class GetterAndSetter extends LightningElement {

    conId;
    handleSuccess(event) {
        this.conId = event.detail.id;
    }

    update(){    
        const event = new ShowToastEvent
            ({
                title: 'Contact Created/updated',
                message:'Updated',
                variant: 'Success'
            });
            this.dispatchEvent(event);
    }

    fields=['FirstName','LastName','Email','AccountId'];

    handleSubmit(){
window.alert('Contact created');
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