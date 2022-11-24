@isTest
public class TestAsynch7 {
    @isTest
    public static void main(){
      Account ac=new Account(name='Test batch',Accountnumber='3');
        insert ac;
        Contact c= new Contact(Lastname='abcd',accountid=ac.id);
        insert c;
        
        test.startTest();
        Asynch7 ach= new Asynch7();
        database.executeBatch(ach);
        test.stopTest();
        
    }
}