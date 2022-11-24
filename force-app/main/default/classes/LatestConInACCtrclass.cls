public class LatestConInACCtrclass {

    public static void afterupdate(List<Contact> connew){
  List<id> aid=new List<id>();
        List<id> cid=new LIst<id>();

    
    for(Contact con:connew){
                cid.add(con.Id);    
        aid.add(con.AccountId);    
    }   
    List<Account> aclist=[Select Recently_added_contact__c from Account where id in:aid];
    for(Account a:aclist){
    a.Recently_added_contact__c=cid[0];
        update aclist;
    }   
    }
}