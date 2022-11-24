trigger TriggerQ8 on Campaign (after update) {

    set<id> cid= new set<id>();
    integer count=0;
    for(Campaign cm:trigger.new){       
        cid.add(cm.id);        
    }
    
    List<Opportunity> op= [select id,stagename,Campaign.status,(select id from OpportunityLineItems) 
                           from Opportunity where CampaignId in:cid];   
    for(Opportunity o:op){
            count= 0;
        for(OpportunityLineItem oli:o.OpportunityLineItems){
            count++;
        }
             if(o.campaign.status=='Completed'){
            if(count>0){
                o.stagename='Closed won';
            }   
            else{
                o.stagename='Closed Lost';
            }                    
        }
    }
    update op; 
}