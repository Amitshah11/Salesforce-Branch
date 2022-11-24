trigger PracticeQ5 on Lead (before insert,before update) {
    
    map<id,lead> ldmap= new map<id,lead>();
    
    for(lead ldtrig:trigger.new){
        if(ldtrig.Status=='Working - Contacted' || ldtrig.Status=='Closed - Converted' && ldtrig.NumberOfEmployees>100){
            ldmap.put(ldtrig.Contact__c,ldtrig);
        }
    }
    
    list<Contact> conlist=[select id,accountid from contact where id in:ldmap.keySet()];
    for(contact co:conlist){
        ldmap.get(co.id).account__c=co.AccountId;
    } 
}