@istest
public class Time1TriggerTest {
@istest
    
    public static void main(){
        
        contact c= new contact(Lastname='test');
        insert c;
        Time1__c tc= new Time1__c();
        tc.name='tast';
        tc.StartDate__c=date.newInstance(2022, 06, 06);
                tc.EndDate__c=date.newInstance(2022, 07, 06);
tc.Contact__c=c.id;
        insert tc;
        
    }
    
    
}