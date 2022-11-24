@istest
public class BrainShiv2Test {
@istest
    public static void main(){
        
       Account a= new Account(name='test');
        insert a;
        Opportunity o= new Opportunity(name='test',closedate=date.today(),stagename='Prospecting',accountid=a.id);
insert o;

contact c= new Contact(Lastname='test',accountid=a.id);
insert c;
        contact c2= new Contact(Lastname='test',accountid=a.id);
insert c2;
        contact c3= new Contact(Lastname='test',accountid=a.id);
insert c3;

OpportunityContactRole ocr= new OpportunityContactRole(contactid=c.id,opportunityid=o.id);
        insert ocr;
        test.startTest();
        BrainShiv2.main();
        test.stopTest();
        
    }
}