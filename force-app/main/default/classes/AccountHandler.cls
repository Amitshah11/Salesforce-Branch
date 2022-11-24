public class AccountHandler {
    public static account insertNewAccount(string name){
        try {
   
    Account acct = new Account();
         acct.name=name;
    insert acct;
                    return acct;

} catch (DmlException e) {
    System.debug('A DML exception has occurred: ' +
                e.getMessage());
    return null;
}
    }}