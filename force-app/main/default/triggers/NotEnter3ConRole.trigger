trigger NotEnter3ConRole on OpportunityContactRole (before insert) {
    
    map<id,OpportunityContactRole> ocrmap=new map<id,OpportunityContactRole>();    
    for(OpportunityContactRole ocr:trigger.new){
        ocrmap.put(ocr.OpportunityId, ocr);
    }
    List<Opportunity> oplist=[select id,(select id from OpportunityLineItems),(select id from OpportunityContactRoles) 
                              from Opportunity where stagename in('prospecting','Qualification') and id in:ocrmap.keyset()];
    for(Opportunity op:oplist){
        if(op.OpportunityLineItems.size()>=2 && op.OpportunityContactRoles.size()>=2){
            ocrmap.get(op.id).addError('Opportunity have more than 2 OLI and OCR and stagename is prospecting or Qualification');
        }
    }
}