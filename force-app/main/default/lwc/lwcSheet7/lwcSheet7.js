import { LightningElement,wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import CONTACT_OBJECT from '@salesforce/schema/Contact';  // import object
import CON_FirstName from '@salesforce/schema/Contact.FirstName'; 

import CON_LastName from '@salesforce/schema/Contact.LastName';  // import fields
import CON_PHONE from '@salesforce/schema/Contact.Phone';
import CON_ACCID from '@salesforce/schema/Contact.AccountId';

import CON_USERNAME from '@salesforce/schema/Contact.UserName__c';
import CON_PASSWORD from '@salesforce/schema/Contact.Password__c';
import CON_EMAIL from '@salesforce/schema/Contact.Email';

export default class LwcSheet7 extends LightningElement {
contactObject = CONTACT_OBJECT;  // object type
contactFields = [ CON_FirstName,CON_LastName,CON_ACCID,CON_PHONE,CON_EMAIL,CON_USERNAME,CON_PASSWORD ];
handleContactCreated(){
    // Run code when account is created.
    const showSuccess2 = new ShowToastEvent({
        title: 'Success!!',
        message: 'Contact has been created',
        variant: 'Success',      
    });
    this.dispatchEvent(showSuccess2);

setTimeout(() => {             
    //  window.location.reload();                        // reload the page after 3 seconds
    eval("$A.get('e.force:refreshView').fire()");       // refresh the page after 3 seconds
}, 3000); 

}


}