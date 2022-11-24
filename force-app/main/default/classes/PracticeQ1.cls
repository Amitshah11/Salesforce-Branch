public class PracticeQ1 {

    public static void main(){
     

        
        
        PricebookEntry pbe= new PricebookEntry();
        pbe.Product2Id=[select id from Product2 where name='new product' limit 1][0].id;
        pbe.Pricebook2Id=[select id from Pricebook2 where name ='Test product price' limit 1][0].id;
        pbe.UnitPrice=2000;
        pbe.IsActive=true;
        insert pbe;
        
        order ord= new order();
        ord.AccountId=[select id from account where name='Amit kumar'][0].id;
        ord.Pricebook2Id=[select id from Pricebook2 where name ='Test product price' limit 1][0].id;
        ord.EffectiveDate=date.today();
        ord.ContractId=[select id from contract where Account.name='Amit kumar' limit 1][0].id;
        ord.Status='Draft';
        insert ord;
        
        
OrderItem oi= new OrderItem();
oi.OrderId= ord.id;
        oi.PricebookEntryId=pbe.id;
        oi.Product2Id=[select id from Product2 where name='new product' limit 1][0].id;
        oi.Quantity=20;
        oi.UnitPrice=2070;
        insert oi;
            
        
    }
}