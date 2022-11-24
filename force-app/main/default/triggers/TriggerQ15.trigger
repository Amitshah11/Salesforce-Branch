trigger TriggerQ15 on Event_Participant__c (before insert,before update) {
    
    
    map<id,Event_Participant__c> Epmap= new  map<id,Event_Participant__c>();
    set<id> eventId= new set<id>();
    for(Event_Participant__c ep:trigger.new){
        Epmap.put(ep.contact__c,ep);
        eventId.add(ep.Event__c);
    }
    
    List<Event_Participant__c> eplist=[select id,contact__c,Event__c,Event__r.Event_Date_Time__c from Event_Participant__c where contact__c in:Epmap.keySet()];
    List<Event__c> evenlist=[select id,Event_Date_Time__c from Event__c where id in:eventId];   
    
    for(Event_Participant__c ev:eplist){
        datetime eventdate;
        for(Event__c evdate:evenlist){
            if(ev.Event__c==evdate.id){                                                                                              
            eventdate=evdate.Event_Date_Time__c;
        
            if( ev.Contact__c==Epmap.get(ev.contact__c).contact__c && ev.Event__r.Event_Date_Time__c.format('yyyy-MM-dd')==eventdate.format('yyyy-MM-dd')){
                
                Epmap.get(ev.contact__c).addError('Contact already registered with another event on this day');
            }
            }}
    }    
}







/*
set<id> con= new Set<id>();
set<id> tim= new Set<id>();
integer tf=0;
for(Event_Participant__c newEvp:trigger.new){
con.add(newEvp.Contact__c);
tim.add(newEvp.Event__c);
}  
List<Event__c> etime=[select Event_date_time__c from Event__c where id in:tim];
List<Event_Participant__c> eptp=[select event__r.Event_date_time__c from Event_Participant__c where contact__c in:con];
for(Event__c evt:etime){
tf=0;
for(Event_Participant__c e:eptp){
if(evt.Event_date_time__c.format('dd:MM:yyyy').equals(e.event__r.Event_date_time__c.format('dd:MM:yyyy'))){
tf++;
}
}}
for(Event_Participant__c newEvp2:trigger.new){

if(tf!=0){
newEvp2.adderror('Already scheduled for another event on that day');
}      }

*/