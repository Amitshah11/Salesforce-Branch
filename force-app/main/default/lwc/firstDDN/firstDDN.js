import UserPreferencesShowStateToGuestUsers from '@salesforce/schema/User.UserPreferencesShowStateToGuestUsers';
import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class FirstDDN extends LightningElement {
myTitle="First Toast message";

HandleClick(){
this.showNotification(this.myTitle);
}
showNotification(abc) {
    

    const evt = new ShowToastEvent({
        title : this.myTitle,
        message : 'Sample Message',
        variant : 'success'
    });
    this.dispatchEvent(evt);
}

}