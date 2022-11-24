public class Queueabletest2 implements Queueable {
    public void execute(QueueableContext context) {
        Account a = new Account(Name='Acme3',Phone='(415) 555-1212');
        insert a;        
    }
}