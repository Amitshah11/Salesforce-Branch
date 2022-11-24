public class batchforIncreasePrice implements Database.Batchable<Sobject> {
    public database.QueryLocator start(Database.BatchableContext bc){
        
        
        return Database.getQueryLocator('Select phone,(select phone from contacts) from Account');
    }
    public void execute(Database.BatchableContext bc,list<Account> acc){
        for(Account a:acc){
            for(contact c:a.contacts){
                if(a.id==c.AccountId){
 				c.phone=a.phone;            }   
            }}
        update acc;
        
    }
    public void finish(Database.BatchableContext bc){
        system.debug('Finish');
    }
}