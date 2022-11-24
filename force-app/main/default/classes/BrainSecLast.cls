public class BrainSecLast {

    public static void main(){
        
        List<Opportunity> oplist=[select name,(select Product2.name from OpportunityLineItems where Quantity>120) 
                                  from Opportunity where stagename='closed won'];
        
        for(Opportunity op:oplist){
            for(OpportunityLineItem opli:op.OpportunityLineItems){
      system.debug('Opp name :'+op.name+' Product name :'+opli.product2.name );
            }
        } 
    }
}