@istest
public class FutureAccConTest {
    @istest
    public static void testing(){
        Account a = new Account(name='future test',accountNumber='21');
        insert a;
        Contact c = new contact(lastname='future test', accountid=a.id);
            insert c;

        List<id> i= new List<id>();
         List<Account> ai= [select id from account];
        For(Account l:ai){                    
          i.add(l.id);
                    }   
        test.starttest();
        FutureAccCon.main(i);
        test.Stoptest();   
        
        List<Account> aclist=[Select id,accountnumber,(select id from contacts) from account];
          For(Account al:aclist){
                    For(Contact cl:al.contacts){
                   system.assertEquals(1, al.contacts.size());
                    }}}}