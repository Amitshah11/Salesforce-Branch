trigger TriggerQ7 on Opportunity (after insert) {

    set<id> oaid= new set<id>();

    for(Opportunity opp:trigger.new){
        
oaid.add(opp.accountid);             
    
    }  
    List<OpportunityContactRole> ocrole= new List<OpportunityContactRole>();
    List<Contact> conlist= [select id,AccountId from contact where accountid in:oaid];
    for(Contact c:conlist){
         for(Opportunity opp1:trigger.new){
             if(opp1.AccountId==c.AccountId){
        OpportunityContactRole ocr= new OpportunityContactRole();
        ocr.OpportunityId=opp1.id;
        ocr.ContactId=c.id;    
        ocrole.add(ocr);
             }}}
    insert ocrole;    
}