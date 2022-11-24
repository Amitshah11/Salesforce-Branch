public class DeleteAccountOppotHandler {
 public static void afterDelete(List<Opportunity> oppOld){
        set<id> sid=new set<id>();
        for(Opportunity a:oppOld){
            
            sid.add(a.AccountId);
            
        }
        List<Account> oplist=[Select id,Name from Account where Id in:sid];
        Delete oplist;
    }
}