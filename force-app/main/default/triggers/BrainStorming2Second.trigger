trigger BrainStorming2Second on Flight_passenger__c (before insert) {
    
    if(trigger.isInsert && trigger.isBefore){
BrainStorming2SecondClass.main(trigger.new);
    }}