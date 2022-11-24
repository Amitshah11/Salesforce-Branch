trigger AkshaGiveQ on OpportunityLineItem (after insert,after update ) {
    
    
    set<id> opid= new set<id>();
    
    for(OpportunityLineItem op:trigger.new){
        
        opid.add(op.OpportunityId);          
    }
    system.debug(opid);
    
    
    List<Account> aclist= new List<Account>();
    
    List<Opportunity> insertquantity=[select id, Accountid from Opportunity where id in:opid];
    
    for(Opportunity opp:insertquantity){
        
        for(OpportunityLineItem oli:trigger.new){
            
            Account acadd= new Account();
            acadd.id=opp.Accountid;
            if(acadd.Total_Quantity__c==null )
            {
                acadd.Total_Quantity__c=0;
            }
            acadd.Total_Quantity__c+=oli.Quantity;
            aclist.add(acadd);   
        }
    }
    update aclist;
    
    
}