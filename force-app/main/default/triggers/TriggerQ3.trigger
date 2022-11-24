trigger TriggerQ3 on Product2 (after insert) {

    set<id> pid= new set<id>();
List<PricebookEntry> pbe= new List<PricebookEntry>();
    List<Pricebook2> stand= [select id from Pricebook2 where IsStandard=true limit 1];
    for(Pricebook2 pb2: stand){      
       For(Product2 pd:trigger.new){
     PricebookEntry pentry= new PricebookEntry();
        
        pentry.product2id=pd.id;
        pentry.pricebook2id=pb2.id;
                pentry.UnitPrice=1;
pentry.IsActive=true;
        
           pbe.add(pentry);
    }      
    }
   insert pbe;   
}