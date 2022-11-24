trigger TriggerQ13 on Plan__c (before insert) {
List<string> loc=new List<string>();  
    decimal tot=0;
    
    for(Plan__C p:trigger.new){
        loc.add(p.location__C);
    }
       
    List<AggregateResult> total= [select sum(Travelling_hours__c) sumOfHours from plan__c where Location__c in:loc group by Name ];
    for(AggregateResult pl:total){
        tot=0;
        tot=tot+integer.valueof(pl.get('sumOfHours'));  
         for(Plan__C p1:trigger.new){
         if((tot+p1.Travelling_hours__c)>100){
             p1.adderror('Limit exceeded');
         }
    }     
    } 
}