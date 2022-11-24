public class SS1task10 {

    public static void contRole(){
        
        
        List<Opportunity> oplist=[select name,account.name,
                          (select id,contact.Account.name from OpportunityContactRoles) 
                          from opportunity where stagename='closed won' or stagename='closed lost'];
for(Opportunity op:oplist){
    for(OpportunityContactRole oprole:op.OpportunityContactRoles)
    {
    if(op.account.name==oprole.contact.Account.name){
        
        system.debug(op.name);
    }
}
}
        
    }
    
    
    
}