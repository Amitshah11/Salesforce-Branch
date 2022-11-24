trigger DeleteAcc on Account (before delete) {    
    map<id,account> acmap=new  map<id,account>();
    for(Account acc:trigger.old){
        acmap.put(acc.id,acc);
    } 
    List<Account> conSize=[select id,(select id from contacts),(select id from Opportunities) from account where id in:acmap.keySet()];
    for(Account a:consize){
        integer size;
        if(a.contacts.size()>0 || a.Opportunities.size()>0){
            acmap.get(a.id).addError('cannot delete the Account');
        }
    }   
}