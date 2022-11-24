trigger Triggersheet10 on OpportunityLineItem (before insert) {

   set<id> opid= new set<id>();
    
    for(OpportunityLineItem opline:trigger.new){
      opid.add(opline.opportunityid);  
                 }  
    
    List<Opportunity> op=[select id,(select id from OpportunityLineItems) from Opportunity where id in:opid];
    for(Opportunity o:op){
       for(OpportunityLineItem opline1:trigger.new){
           if(o.OpportunityLineItems.size()>=2){
               opline1.adderror('cannot add more the 2 OLI');
           }
        
       }}    
}