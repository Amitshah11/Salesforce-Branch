public class brainS6 {
    public static void main(){
        
        List<id> aid= new List<id>();
        List<Account> aclist=[select name,(select name from contacts) from account];
        for(account ac:aclist){
            
            for(contact con:ac.contacts){
                
             if(ac.contacts.size()>5){
                system.debug(ac.name);
            }   
            }
        }

            }}