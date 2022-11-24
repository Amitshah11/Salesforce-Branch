trigger TriggerQ10 on OpportunityLineItem (before insert) {
        set<id> opli= new set<id>();
            set<id> opiId= new set<id>();

 for(OpportunityLineItem opp:trigger.new){
     
        opli.add(opp.OpportunityId);
    }
        List<OpportunityLineItem> oplist=[Select id from OpportunityLineItem where OpportunityId in:opli];
    for(OpportunityLineItem OLI:oplist){
        opiId.add(OLI.id);
    }
    for(OpportunityLineItem opp1:trigger.new){
             if(opiId.size()>=2){
                 opp1.adderror('Can not create more than 2 OLI');
      
    }
  }    
}