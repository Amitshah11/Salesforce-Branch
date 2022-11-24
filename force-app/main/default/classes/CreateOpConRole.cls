public class CreateOpConRole {

    public static void main(){
        
        Account ac= new Account();
        ac.name='aman verma';
        insert ac;
        
        Opportunity op= new Opportunity();
        op.AccountId=ac.id;
        op.stagename='closed won';
        op.CloseDate=system.today();
        op.name='Aman verma op';
        insert op;
        
        Contact con= new contact();
                con.firstname='aman ';
        con.lastname='verma con';
        con.AccountId=ac.id;
        insert con;
              
        OpportunityContactRole ocr= new OpportunityContactRole();
        ocr.ContactId=con.id;
        ocr.OpportunityId=op.id;
        insert ocr;                       
    }            
}