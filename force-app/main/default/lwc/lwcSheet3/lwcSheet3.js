import { LightningElement,wire,api, track } from 'lwc';
import updateClosedate from "@salesforce/apex/Aura3Class.updateClosedate";

export default class LwcSheet3 extends LightningElement {
    @api recordId;
 
    @track dateUp;

    newDate(event)
    {
        this.dateUp = event.target.value;
    
    updateClosedate({Opid:this.recordId, clos:this.dateUp})
    .then((data)=>{
        console.log('success');
    })
    .catch((error)=>{
        console.log('error: '+error.msg());
    });

    setTimeout(() => {
        eval("$A.get('e.force:refreshView').fire()");
    }, 2000);
}}