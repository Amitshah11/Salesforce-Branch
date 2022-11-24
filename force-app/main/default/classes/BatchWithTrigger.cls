global class BatchWithTrigger implements database.Batchable<sobject>{
    
   global list<contact> start(database.BatchableContext bc){
        return trigger.new;
    }    
    global void execute (database.BatchableContext bc, list<Contact> con){
            
        for(contact c:con){
            c.lastname=c.lastname+' x';
        }
    }
    global void finish(database.BatchableContext bc){
    }
}