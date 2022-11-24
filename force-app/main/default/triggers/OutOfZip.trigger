trigger OutOfZip on Account (before update) {
    
    Map<id,account> acid= new map<id,account>();
    for(Account actrig:trigger.new){
        
        acid.put(actrig.id,actrig);
    }
    
    List<Account> upd= new List<account>();
    integer count;
    List<Account> aclist=[select id,BillingPostalCode,Match_Billing_Address__c, (select mailingPostalCode from contacts) 
                          from account where id in:acid.keyset()];
    for(account ac:aclist){
        count=0;
                   for(contact c:ac.contacts){
                
                if(ac.BillingPostalCode!=c.mailingPostalCode){
                    count++;
                }   
                else if(acid.get(ac.id).BillingPostalCode!=c.mailingPostalCode){
                    count++;
                }
            }
            if(count==ac.contacts.size()){
                acid.get(ac.id).Match_Billing_Address__c=true;
            }   
            else if(count>=ac.contacts.size()){
                acid.get(ac.id).Match_Billing_Address__c=false;
         }       
    }
}