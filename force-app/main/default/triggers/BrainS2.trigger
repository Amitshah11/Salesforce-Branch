trigger BrainS2 on Opportunity (after insert) {

  List<id> acid=new List<id>();
    for(Opportunity opp:trigger.new){
        acid.add(opp.accountid);        
    }
     List<OpportunityContactRole> Oppcon= new List<OpportunityContactRole>();
    List<Contact> conlist=[Select id from Contact where accountid in:acid];
    for(contact co:conlist){
        for(Opportunity opp1:trigger.new){
        OpportunityContactRole ocr= new OpportunityContactRole();
        ocr.OpportunityId=opp1.id;
        ocr.ContactId=co.id;
        Oppcon.add(ocr);
              
        }}
    insert Oppcon;
    
}