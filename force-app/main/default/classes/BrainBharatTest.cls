@istest
public class BrainBharatTest {
@istest
    
    public static void main(){
        
        Product2 p = new Product2(name='bharat');
        insert p;
        
        Opportunity op= new Opportunity(name='testop',stagename='closed won',closedate=date.today());
        insert op;
        
        id stb = test.getStandardPricebookId();

        
        Pricebookentry pb= new Pricebookentry();
        pb.product2id=p.id;
        pb.Pricebook2Id=stb;
        pb.UnitPrice=30000;
        pb.IsActive=true;
        insert pb;
        
        OpportunityLineItem opl= new OpportunityLineItem();
        opl.PricebookEntryId=pb.id;
        opl.OpportunityId=op.id;
        opl.Quantity=40;
        opl.Rating__c='5';
        opl.TotalPrice=244;
        insert opl;
        
        test.startTest();
        BrainBharat.main();
        test.stopTest();
        
    }
}