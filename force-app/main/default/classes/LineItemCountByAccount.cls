public class LineItemCountByAccount {
    public static void countOli(){
        
        map<id,list<id>> oplisize=new  map<id,list<id>>();
        
        List<OpportunityLineItem> oliAclist=[select id,Opportunity.accountId from OpportunityLineItem where Opportunity.accountId!=null];
        for(OpportunityLineItem oppline:oliAclist){ 
            if(!oplisize.containskey(oppline.Opportunity.accountId)){
                oplisize.put(oppline.Opportunity.accountId, new List<id>());
            }
            oplisize.get(oppline.Opportunity.accountId).add(oppline.id);     
        }
        
        List<Account> updateOliSize = new List<Account>();
        for(id ids:oplisize.keyset()){
            Account acupdate= new Account();
            acupdate.id=ids;
            acupdate.countOpp__c=oplisize.get(ids).size(); 
            updateOliSize.add(acupdate);
        }
        update updateOliSize;
    }
}