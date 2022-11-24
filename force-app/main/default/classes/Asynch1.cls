global class Asynch1 implements Database.Batchable<sObject>{
        global Database.QueryLocator start(Database.BatchableContext BC){

            return Database.getQueryLocator('select id from Account where createddate=LAST_N_DAYS:13');
        }
      
       global void execute(Database.BatchableContext BC, List<Account> accountList){
             
      Database.delete(accountList, false);
     
       }
     
       global void finish(Database.BatchableContext BC){
       }
}