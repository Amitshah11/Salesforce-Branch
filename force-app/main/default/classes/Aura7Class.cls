public class Aura7Class {
@auraEnabled
    public static List<Account> showAccDetails(){
        
        List<Account> acclist= [Select id,name,Phone from account limit 50];
        return acclist;
        
    }
}