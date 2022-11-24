trigger Trigger21 on Contact (before insert) {
    
    map<id,contact> sid= new map<id,contact>();
    for(Contact c:trigger.new){
        sid.put(c.accountid,c);
    }               
    List<Account> ac=[select id,Allow_multiple__c,(select id from contacts) from account where id in:sid.keyset()];
    for(Account a:ac){
        if(a.Allow_Multiple__c==false && a.contacts.size()>0){
            sid.get(a.id).adderror('Check "Allow Multiple" from Account to create multiple contact with relate of that Account');                   
        }
    }
}