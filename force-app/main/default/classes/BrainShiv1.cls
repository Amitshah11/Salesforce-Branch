public class BrainShiv1 {

    public static void main(){
        
        List<Opportunity> op=[Select name,(select name, product2.rating__c,rating__c from OpportunityLineItems) from Opportunity];
        
        for(Opportunity o:op){
            for(OpportunityLineItem oli:o.OpportunityLineItems){
                
                if(oli.product2.rating__c=='5' && oli.rating__c=='2'){
                  
                    system.debug(o.name);
                }
            }
            
        }
        }}