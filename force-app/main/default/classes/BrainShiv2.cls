/*
Write a script to get all the opportunity's ContactRole name if ContactRole Account has more than 2 Contacts in them.
*/
public class BrainShiv2 {
    public static void main(){
        set<id> conid2= new Set<id>();
        
        set<id> conid= new Set<id>();
        List<Account> aclist= [select id, (select id,name from contacts) from account];
        for(Account ac:aclist){
            for(contact con:ac.contacts){
                if(ac.contacts.size()>2){
                    conid.add(con.id);
                }
            }
        }     
        List<OpportunityContactRole> ocrlist=[select contact.name,contactid from OpportunityContactRole];
        for(OpportunityContactRole ocr:ocrlist){          
            if(conid.contains(ocr.contactid)){
                conid2.add(ocr.contactid);            
            }        
        }     
        List<Contact> conlist=[Select name from contact where id in:conid2];
        for(contact co:conlist){           
            system.debug(co.name);
        }
    }
}