global class Asynch7 implements Database.Batchable<sObject>{
        global Database.QueryLocator start(Database.BatchableContext BC)
        {
            return Database.getQueryLocator('select AccountNumber,id,(Select id from contacts) from Account');
        }      
       global void execute(Database.BatchableContext BC, List<Account> acc)
       {
             List<Account> acou=new List<Account>();
           for(Account a:acc)
           {
               Account ac=new Account();
               ac.id=a.id;
             ac.AccountNumber=string.valueof(a.contacts.size());
               acou.add(ac);
           }
           update acou;    
       }     
       global void finish(Database.BatchableContext BC){}
}