trigger TriggerQ6 on Opportunity (before update) {

    Map<id,Opportunity> opid= new  Map<id,Opportunity>();
    
    For(Opportunity op:trigger.new){
   opid.put(op.id,op);
        
    }
             
 
    List<Opportunity> oplist=[select id,(select id,Opportunityid from OpportunityLineItems) from Opportunity where id in:opid.keyset()];
    for(Opportunity o:oplist){ 
       
         if(o.OpportunityLineItems.size()==0 && opid.get(o.id).id==o.id && opid.get(o.id).StageName=='Closed won'){
             opid.get(o.id).adderror('Stage is closed without any OLI');
         }   
    }     
    }