@istest
public class AvgRatingTest {
@istest
    public static void main(){
        
        Contact con= new Contact(lastname='test');
        insert con;
         
        Maintenance__c m= new Maintenance__c();
        m.Contact__c=con.id;
        m.Name='test';
        m.Rating__c='5';
        insert m;
        
          Maintenance__c m2= new Maintenance__c();
        m2.Contact__c=con.id;
        m2.Name='test';
        m2.Rating__c='4';
        insert m2;
 
    }
}