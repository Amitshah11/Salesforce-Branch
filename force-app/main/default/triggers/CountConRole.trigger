trigger CountConRole on OpportunityContactRole (after insert) {
    
    map<id,OpportunityContactRole> opid= new   map<id,OpportunityContactRole>();
    for(OpportunityContactRole ocr:trigger.new){
        opid.put(ocr.Opportunityid,ocr);
     
    }
    List<Opportunity> oplist=[select name,(select id from OpportunityContactRoles) from Opportunity where id in :opid.keyset()];

    for(Opportunity op:oplist){
        op.name=op.name+' '+op.OpportunityContactRoles.size();
        system.debug(opid.get(op.id));
    }
    update oplist;

}