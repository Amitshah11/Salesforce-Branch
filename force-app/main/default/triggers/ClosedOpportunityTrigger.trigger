trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {

    List<task> ta= new List<Task>();
    if(trigger.Isafter){
        
        for(Opportunity op: trigger.new)   {  
            if(op.stagename=='closed won'){
        Task t= new Task();
        t.WhatId=op.id;
                t.Subject='Follow Up Test Task';
        ta.add(t);
        
            }}
        insert ta;
    }
}