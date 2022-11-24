public class BrainShikha2 {

    public static void main(){
        
Set<id> acid= new Set<id>();        
        List<Account> aclist=[Select name,id,(select id from contacts) from account];
        for(Account ac:aclist){
            if(ac.contacts.size()>5){
                acid.add(ac.id);
            }
        }
                List<Account> alist=[select name,id,(select accountid,id from contacts) from account where id in:acid];

        
        for(Account a:alist){
             Account newAcc= new Account();
                newacc.name=a.name;
                insert newAcc;
            for(contact cont:a.contacts){
            for(integer i=5;i<a.contacts.size();i++){
                cont.AccountId=newAcc.id;
                update alist;
                    }}
        }                

        
        }       

        
        
       
 }