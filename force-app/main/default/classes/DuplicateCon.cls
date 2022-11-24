/*
Create a custom field called duplicate(checkbox) in Account. Write a script to check if the contact in the Account
and contact roles in its related opportunity are same then set the checkbox to true. 
*/

public class DuplicateCon {
    public static void main(){
        
        map<id,List<id>> AcConMap= new map<id,list<id>>();
        List<Account> Aclist=[select id,name,(select id,AccountId,name from contacts) from account];
        for(Account ac:Aclist){
            for(Contact co:ac.contacts){
                if(!AcConMap.containskey(ac.id)){
                    AcConMap.put(ac.id,new List<id>()); 
                }
                AcConMap.get(ac.id).add(co.id);
            }}             
        integer count;
        
        List<Opportunity> oplist=[select id,AccountId,(select contactid from OpportunityContactRoles)
                                  from opportunity where accountid in:AcConMap.keyset()];
        for(Opportunity op:oplist){
            count=0;
            for(OpportunityContactRole ocr:op.OpportunityContactRoles){
                if(AcConMap.get(op.accountid).contains(ocr.contactid)){
                    count++;
                }}
            if(count==AcConMap.get(op.accountid).size() && AcConMap.get(op.accountid).size()==op.OpportunityContactRoles.size()){
                Account ac= new Account();
                ac.id=op.AccountId;
                ac.Duplicate_contact__c=true;
                update ac;
            }
            else {
                Account ac2= new Account();
                ac2.id=op.AccountId;
                ac2.Duplicate_contact__c=false;
                update ac2;                   
            }  
        }
    }
}