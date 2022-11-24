public class AccConAmountTrHandler {

    public static void afterInsert(List<Contact>  AmountIns)
    {
        double insAm;        
        set<id> sid1=new set<id>();

        For(contact con1:AmountIns){
            insam=con1.Amount__c;
            sid1.add(con1.AccountId);
            
        }
        List<Account> aclist1=[Select Sum_of_Amount__c from Account where id in:sid1];
         for(Account ac1:aclist1){
            ac1.Sum_of_Amount__c=ac1.Sum_of_Amount__c+insam;           
        }
        update aclist1;

    }
    
    public static void afterUpdate(List<Contact>  newAmount, List<Contact>  oldamount){
        set<id> sid2=new set<id>();
double amt;
        for(Contact con2 : newAmount)
{for(Contact con21 : oldamount)
{
If(con2.Amount__c!=con21.Amount__c)
{amt=con2.amount__c-con21.amount__c;
sid2.add(con2.AccountId);
}
}}
        List<Account> aclist2=[Select Sum_of_Amount__c from Account where id in:sid2];
        for(Account ac2:aclist2){
            ac2.Sum_of_Amount__c=ac2.Sum_of_Amount__c+amt;
            
        }
        update aclist2;

        
    }
    public static void afterDelete(List<Contact>  amountdel){
        
        double delam;
        set<id> sid3=new set<id>();
        for(Contact con3:amountdel){
            delam=con3.Amount__c;
            sid3.add(con3.AccountId);
            
        }
        List<Account> aclist3=[Select Sum_of_Amount__c from Account where Id in:sid3];
 for(Account ac3:aclist3){
            ac3.Sum_of_Amount__c=ac3.Sum_of_Amount__c-delam;
            
        }
        update aclist3;

        
    }
    
    public static void afterUnDelete(List<Contact>  amountUndel){
        
        double undelam;
        set<id> sid4=new set<id>();
        for(Contact con4:amountUndel){
            undelam=con4.Amount__c;
            sid4.add(con4.AccountId);
            
        }
        List<Account> aclist4=[Select Sum_of_Amount__c from Account where Id in:sid4];
 for(Account ac4:aclist4){
            ac4.Sum_of_Amount__c=ac4.Sum_of_Amount__c+undelam;
            
        }
        update aclist4;

        
    }

    
}