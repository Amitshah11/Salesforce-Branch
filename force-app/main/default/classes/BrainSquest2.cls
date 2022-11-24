public class BrainSquest2 {

    Public static void Question2(){
        
         List<Contact> conlist=[select name,account.name,
                          (select id,opportunity.Account.name from OpportunityContactRoles) from Contact];
        
        for(Contact con:conlist){
            for(Opportunity o:con.opportunities){
                system.debug(o.account.name);
            }
            }                    
        }
        
     
        
    }