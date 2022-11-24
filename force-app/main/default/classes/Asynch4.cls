global class Asynch4 implements Database.Batchable<sObject>{
        global Database.QueryLocator start(Database.BatchableContext BC){

            return Database.getQueryLocator('Select id from account limit 5');
        }
      
       global void execute(Database.BatchableContext BC,list<Account> acc){
             List<Opportunity> oplist= new List<Opportunity>();
           integer i=1;
           for(account a:acc){
Opportunity opp=new Opportunity();
opp.name='Asynch '+i;
               opp.CloseDate=date.today()+10;
               opp.StageName='Prospecting';
               opp.AccountId=a.id;
               oplist.add(opp);
               i++;
           }
insert oplist;     
       }
     
       global void finish(Database.BatchableContext BC){
       }
}



/*
global class Asynch2 implements schedulable
{
 global void execute(SchedulableContext sc)
    {      database.executebatch(new batchsheet1());
    }
}


public class AsyncExecutionExample implements Queueable {
    public void execute(QueueableContext context) {
            }
}


*/