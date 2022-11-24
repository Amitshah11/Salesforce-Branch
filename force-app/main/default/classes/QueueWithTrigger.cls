public class QueueWithTrigger implements Queueable {
    List<Account> acc;
    public QueueWithTrigger(List<Account> actrig){
        this.acc=actrig;       
    }
 public void execute(QueueableContext context) {
 
     for(Account a:acc){
         
         Contact c= new Contact();
         c.lastname=a.name;
         c.AccountId=a.id;
         insert c;
     }
     
 }

}