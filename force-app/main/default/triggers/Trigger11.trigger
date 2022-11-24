trigger Trigger11 on Account(after insert) {
    
    List<contact> conlist= new List<Contact>();
    List<Case> caselist= new List<Case>();
    List<Opportunity> opplist= new List<Opportunity>();
    List<OpportunityContactRole> conrolelist= new List<OpportunityContactRole>();
    
    List<id> accid=new List<id>();
    List<id> conid=new List<id>();
    List<id> opid=new List<id>();
    
    for(Account ac:trigger.new){
        if(ac.NumberOfEmployees>=200){
            accid.add(ac.id);
             Contact con= new Contact();          
        con.lastname='Trigger11';
        con.accountid=ac.id;
        conlist.add(con);
        }
    }
     
    insert conlist;
    List<contact> cono=[select id from contact where id in:conlist];
    for(Contact c:cono){
        conid.add(c.id); 
    }
    for(integer k=0;k<accid.size();k++){
        Opportunity opp= new Opportunity();
        opp.name='Trigger11';
        opp.accountid=accid[k];
        opp.stagename='Closed won';
        opp.closedate=system.today();
        opplist.add(opp);
    }
    insert opplist;
    List<Opportunity> oppo=[select id from Opportunity where id in:opplist];
    for(Opportunity o:oppo){
        opid.add(o.id); 
    }
    for(integer l=0;l<accid.size();l++){            
        OpportunityContactRole ocr= new OpportunityContactRole();
        ocr.contactid=conid[l];
        ocr.opportunityid=opid[l];
        conrolelist.add(ocr);
    }
    insert conrolelist;
    
    for(integer j=0;j<accid.size();j++){ 
        case cs= new case();
        cs.contactid=conid[j];
        cs.Accountid=accid[j];
        cs.Origin='Email';
        caselist.add(cs);
    }
    insert caselist;
}