public class BatchPractice implements Database.Batchable<Sobject> {
    public database.QueryLocator start(Database.BatchableContext bc){
        
        
        return Database.getQueryLocator('Select name from opportunity');
    }
    list<Opportunity> oplist= new List<Opportunity>();
    public void execute(Database.BatchableContext bc,list<opportunity> con){
        for(opportunity c:con){
           Opportunity op=new Opportunity();
            op.id=c.id;
            c.name=c.name+'0' ;
              oplist.add(op);
        }    
        update oplist;
         
            }

    public void finish(Database.BatchableContext bc){
        system.debug('Finish');
    }
}