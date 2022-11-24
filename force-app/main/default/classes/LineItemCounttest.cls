@istest
public class LineItemCounttest {
@istest
    public static void testing(){
        
        Account ac= new Account(name='test');
        insert ac;
        
        Opportunity op= new Opportunity(name='testop',closedate=date.today(),stagename='closed won', accountid=ac.id);
        insert op;
        
        Product2 pro= new Product2(name='testproduct');
        insert pro;
        
        id pricebookid=test.getStandardPricebookId();
        
        PricebookEntry entry= new PricebookEntry();
        entry.Pricebook2Id=pricebookid;
        entry.Product2Id=pro.id;
        entry.IsActive=true;
        entry.UnitPrice=3000;
        insert entry;
        
        OpportunityLineItem oli= new OpportunityLineItem();
        oli.OpportunityId=op.id;
        oli.Quantity=200;
        oli.PricebookEntryId=entry.id;
        oli.UnitPrice=20;
        insert oli;
        
        test.starttest();
        LineItemCountByAccount.countOli();
        test.stopTest();
        
        
    }
}