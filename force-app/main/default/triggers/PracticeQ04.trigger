trigger PracticeQ04 on Account (before update) {

    map<id,Account> acMap=new Map<id,account>();
    for(Account actrig:trigger.new){
        acmap.put(actrig.id, actrig);        
    }
    
    List<Account> aclist=[select id,Duplicate_contact__c,BillingPostalCode, (select id,MailingPostalCode from contacts) 
                          from account where id in:acmap.keySet()];
    
    for(Account ac:aclist){
        integer count=0;
        for(contact con:ac.contacts){
            if(acmap.get(ac.id).BillingPostalCode!=con.MailingPostalCode){
                count++;
            }
        }
        if(count >0){
           acmap.get(ac.id).Duplicate_contact__c=true;
        }
        else{
           acmap.get(ac.id).Duplicate_contact__c=false;
        }
    }  
}