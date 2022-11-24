@istest
public class BrainNitin2Test {
    @istest
    public static void main(){
        contact c =new Contact(Lastname='test');
        insert c;
        
        contact c1 =new Contact(Lastname='test2');
        insert c1;

        Daily_status__C ds= new Daily_status__C();
        ds.Login_time__c=datetime.now();
            ds.Logout_time__c=datetime.now()+1;
        ds.Contact__c=c.id;
        insert ds;
        
        Daily_status__C ds2= new Daily_status__C();
        ds2.Login_time__c=datetime.now();
            ds2.Logout_time__c=datetime.now()+1;
        ds2.Contact__c=c1.id;
        insert ds2;
        
        test.startTest();
        BrainNitin2.main();
        Test.stopTest();
    }
}