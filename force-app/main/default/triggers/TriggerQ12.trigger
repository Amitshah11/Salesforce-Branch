trigger TriggerQ12 on Opportunity (after insert) {

    
    List<Case> caselist=new List<case>();
     for(Opportunity opp1:trigger.new){
        
        if(opp1.Stagename=='Closed lost'){
            Contact co= new Contact();
            co.LastName='TriggerQ12';
            co.AccountId=opp1.AccountId;
            insert co;
            
            case ca= new case();
    ca.AccountId=opp1.AccountId;
    ca.ContactId=co.id;
    ca.Origin='Email';
    caselist.add(ca);
    Insert caselist;       
        }    
         }  
}