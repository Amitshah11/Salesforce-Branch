public class OppLine {
 public static void main(){
        
       map<id,decimal> olimap=new  map<id,decimal>();
        List<AggregateResult> relatedOpp=[select Opportunity.Accountid acid,count(id) olid from opportunityLineItem group by Opportunity.Accountid];
        
        for(AggregateResult agri:relatedOpp){
            olimap.put((id)agri.get('acid'), (decimal)agri.get('olid'));
        } 
        List<Account> accupdate=[select id,CountOpp__c from account where id in:olimap.keySet()];
        for(account acc:accupdate){
            acc.CountOpp__c=olimap.get(acc.id) ;
            update accupdate;
        }
    }
}