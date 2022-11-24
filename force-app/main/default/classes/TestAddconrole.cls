public class TestAddconrole {

    public static void main(){
        
        
        Account ac= new Account(Name='test');
        insert ac;
        contact con = new contact(LastName='testlast',AccountId=ac.id);
        insert con;
        
        Opportunity opp= new Opportunity(name='testOpp',Accountid=ac.id,stagename='closed Lost',closedate=date.today());
        insert opp;
        
       OpportunityContactRole ocrole= new OpportunityContactRole();
        ocrole.contactid=con.id;
        ocrole.opportunityid=opp.id;
        insert ocrole;
      
                OpportunityContactRole op=[select contactId from OpportunityContactRole where opportunityid=:opp.id limit 1];

        system.debug(op);
        
    }
}