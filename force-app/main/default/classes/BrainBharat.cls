/*Create a field highest price, lowest price both of currency type on opportunity. 

Write a script to find the highest and lowest price from the Opportunity line item and fill their respective fields.*/

public class BrainBharat {
    public static void main(){
        
        List<Opportunity> oppl= new List<Opportunity>();
        List<Opportunity> oplist= [Select id,highest_listprice__c,lowest_listprice__c from Opportunity];
        
        List<AggregateResult> aglist= [Select opportunityid,min(UnitPrice)min, max(UnitPrice) max 
                                       from OpportunityLineItem group by opportunityid];
        
        for(Opportunity op:oplist){
            for(AggregateResult ag:aglist){
                if(ag.get('opportunityid')==op.id){
                    Opportunity o= new Opportunity();
                    o.id=op.id;
                    o.Highest_listprice__c=integer.valueOf(ag.get('max'));
                    o.lowest_listprice__c=integer.valueOf(ag.get('min'));
                    oppl.add(o);
                }
            }            
        }
        update oppl;
    }
}