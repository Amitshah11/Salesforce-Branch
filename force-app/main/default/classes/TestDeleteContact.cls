@istest
public class TestDeleteContact {
@istest
    public static void deletetest(){
       Account ac= new Account(Name='Bhuvan');
        Insert ac;
        
        Contact con= new Contact(firstName='Amit', lastName='Shah', Accountid=ac.id);
        insert con;
        
        
        test.startTest();
        DeleteContact.deleteCon();
        test.stopTest();
        
    }
}