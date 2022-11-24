public class FutureAccCon {
    public static void main(List<id> acid){
        List<Account> a=[select name,accountNumber,(select id from contacts ) from account where id in:acid];
        for(Account ac:a){
                                       ac.accountnumber=string.valueOf(ac.contacts.size());

            for(contact c:ac.contacts){

            system.debug(c.id);
      
            }}
        update a;
        
    }
}