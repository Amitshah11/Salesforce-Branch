trigger AddConRole on Opportunity (after insert) {

    set<Id> acid=new set<id>();
    list<id> conid= new List<id>();
    for(Opportunity op:trigger.new){
    acid.add(op.accountId);
    }
        
       List<Account> AcCon=[Select id,(select id from contacts) from account where id in:acid];
    for(Account ac: AcCon){
        for(Contact co:ac.Contacts){
            conid.add(co.id);
        }   
        }
    
    for(Opportunity op1:trigger.new){
        for(integer i=0;i<conid.size();i++){
     OpportunityContactRole ocr= new OpportunityContactRole();
        ocr.ContactId=conid[i];
            ocr.OpportunityId=op1.id;
            insert ocr;
            }}
}