import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'; // for toast notification
import ACCOUNT_OBJECT from '@salesforce/schema/Account';  // import object
import AC_NAME from '@salesforce/schema/Account.Name';  // import fields
import AC_WEBSITE from '@salesforce/schema/Account.Website';
import AC_NUMBER from '@salesforce/schema/Account.AccountNumber';
import AC_INDUSTRY from '@salesforce/schema/Account.Industry';
import AC_RATING from '@salesforce/schema/Account.Rating';
import AC_PHONE from '@salesforce/schema/Account.Phone';
import AC_ID from '@salesforce/schema/Account.Id';


import CONTACT_OBJECT from '@salesforce/schema/Contact';  // import object
import CON_NAME from '@salesforce/schema/Contact.LastName';  // import fields
import CON_ACCID from '@salesforce/schema/Contact.AccountId';
import CON_PHONE from '@salesforce/schema/Contact.Phone';
import CON_USERNAME from '@salesforce/schema/Contact.UserName__c';
import CON_PASSWORD from '@salesforce/schema/Contact.Password__c';
import CON_ID from '@salesforce/schema/Contact.Id';



export default class LwcSheet1 extends LightningElement {
    accountObject = ACCOUNT_OBJECT;  // object type
    accountFields = [AC_NAME, AC_WEBSITE,AC_NUMBER, AC_INDUSTRY, AC_RATING, AC_PHONE,AC_ID]; // fields to be showin in form
    // shows toast message after account creation
    handleAccountCreated(){
        // Run code when account is created.
        const showSuccess = new ShowToastEvent({
            title: 'Success!!',
            message: 'Account has been created',
            variant: 'Success',      
        });
        this.dispatchEvent(showSuccess);
        setTimeout(() => {             
            //  window.location.reload();                        // reload the page after 3 seconds
            eval("$A.get('e.force:refreshView').fire()");       // refresh the page after 3 seconds
          }, 3000);
    }

        contactObject = CONTACT_OBJECT;  // object type
        contactFields = [ CON_NAME,CON_ACCID,CON_PHONE,CON_PASSWORD,CON_USERNAME,CON_ID ];
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