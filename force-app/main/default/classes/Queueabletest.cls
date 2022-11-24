public class Queueabletest implements Queueable {
    public void execute(QueueableContext context) {
        Account a = new Account(Name='Acme2',Phone='(415) 555-1212');
        insert a;        
        System.enqueueJob(new Queueabletest2());
    }
}