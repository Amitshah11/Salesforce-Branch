public class queueablePractice implements Queueable {
    
    Private list<Account> acclist;
    
    public queueablePractice(List<Account> acl){
        this.acclist=acl;
        
    }
    public void execute(QueueableContext context) {
          
        for(Account ac:acclist){
            Contact co= new Contact();
            co.AccountId=ac.id;
            co.LastName='queuetest';
            insert co;
        }
    }
}