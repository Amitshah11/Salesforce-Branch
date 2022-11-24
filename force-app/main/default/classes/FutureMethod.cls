public class FutureMethod {
@future
    Public static void ftr(List<id> pbid){
    List<PricebookEntry> aco= new List<PricebookEntry>();
        List<PricebookEntry> pc= [select UnitPrice,name from PricebookEntry where id in: pbid];
        For(PricebookEntry pbe:pc){
            
          pbe.Unitprice=pbe.UnitPrice+0.5;
            system.debug(pbe.name);

        }        
        update pc;
        
        
        
    }
    
}