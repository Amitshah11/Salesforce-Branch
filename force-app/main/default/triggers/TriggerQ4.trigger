trigger TriggerQ4 on Contact (before insert,before delete) {
    
    if(trigger.isinsert){
        map<id,Contact> acid= new  map<id,Contact>();
        for(contact con:trigger.new){
            acid.put(con.AccountId,con);         
        }
        List<account> aclist=[select id,name from account where id in: acid.keyset()];
        for(account ac:aclist){
            if(acid.get(ac.id).AccountId==ac.Id){
                
                ac.name=ac.name+' '+acid.get(ac.id).LastName;
                update aclist;                
            }  
        }        
    }    
    if(trigger.isDelete){
        map<id,contact> acid2= new  map<id,contact>();
        
        for(Contact c:trigger.old){
            
            acid2.put(c.accountid,c);
        }
        List<Account> aco=[select name from account where id in:acid2.keyset()];
        for(account a:aco)
        {            
            String[] nam=a.name.split(acid2.get(a.id).LastName);
            a.name=nam[0];
            update aco;
        }           
    }  
}