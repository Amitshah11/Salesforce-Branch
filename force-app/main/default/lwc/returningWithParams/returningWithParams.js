import { LightningElement, api, track, wire } from "lwc";
import AccountList from "@salesforce/apex/ApexClass1.AccountList";
import ContactList from "@salesforce/apex/ApexClass1.ContactList";
import OpportunityList from "@salesforce/apex/ApexClass1.OpportunityList";



export default class ReturningWithParams extends LightningElement {

  accountName;
   Accid;
 

   oppList=[];
accList=[];
conList=[];


changename(event){
  this.accountName=event.target.value;
}


@wire(AccountList,{search:'$accountName'})
  
    ListofAccounts({ error, data }) {
     
        if (data) {
          this.accList=data;
        } 
          else if (error) {
          console.log(error);
        }
    }
  
    ConOpp(event){
      this.Accid=event.target.value;
          }

    @wire(ContactList,{acid:'$Accid'})
  
    ListofContact({ error, data }) {
     
        if (data) {
          this.conList=data;
        } 
          else if (error) {
          console.log(error);
        }
    }


    @wire(OpportunityList,{acid:'$Accid'})
  
    ListofOpportunity({ error, data }) {
     
        if (data) {
          this.oppList=data;
        } 
          else if (error) {
          console.log(error);
        }
    }
}