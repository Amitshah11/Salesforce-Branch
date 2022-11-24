trigger TriggerQ14 on Event_Participant__c (before insert,before update) {
    
    map<Id,Event_Participant__c> eid=new map<Id,Event_Participant__c>();  
    
    for(Event_Participant__c ep:trigger.new){        
        eid.put(ep.Event__c,ep);     
    }
    List<Event_Participant__c> eplist=[select id,contact__c,Event__c from Event_Participant__c where Event__c in:eid.keyset()];
    for(Event_Participant__c e:eplist){
        
        if(eid.get(e.Event__c).contact__c==e.contact__c){
            eid.get(e.Event__c).adderror('Participant already registered in this event');
        }        
    }        
}