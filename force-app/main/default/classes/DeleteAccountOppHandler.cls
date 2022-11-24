public class DeleteAccountOppHandler {
    public static void afterDelete(List<Account> AccOld){
        set<id> sid=new set<id>();
        for(Account a:AccOld){
            
            sid.add(a.id);
            
        }
        List<Opportunity> oplist=[Select Name from Opportunity where AccountId in:sid];
        Delete oplist;
    }
    }