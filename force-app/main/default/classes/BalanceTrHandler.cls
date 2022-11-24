public class BalanceTrHandler {

public static void afterInsert(List<Transaction__c>  newList)
{         
     double BalAm;
set<id> sid=new set<id>();
For(Transaction__c tr: newList)
{
BalAm=tr.Balance_Amount__c;
sid.add(tr.Bank_Account__c);
}
       List<Bank_Account__c> Banklist=[Select Balance__c from Bank_Account__c where id IN:sid];

for(Bank_Account__c ba: Banklist)
{
    ba.Balance__c=ba.Balance__c+BalAm;
}
    update Banklist;
  }

}