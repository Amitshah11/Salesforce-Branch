trigger BrainsQues6Tr on Contact (after insert) {

    list<id> cid= new list<id>();
        list<id> count= new list<id>();
            string nam;
                list<Contact> conlist= new list<contact>();

    for(contact c:trigger.new){        
        cid.add(c.AccountId);
    }
    
    List<Contact> con=[select id,Account.name from contact where accountid in:cid];
    for(contact co:con){
        count.add(co.id);
                nam=co.account.name;
    }
    
    if(count.size()>10){
        Account ac=new Account(); 
        ac.Name=nam+'"';
        insert ac;
        
        for(integer i=10;i<count.size();i++){
            
                    Contact ci =new contact();
            ci.id=count[i];
            ci.AccountId=ac.id;
            conlist.add(ci);
        }
        update conlist;
    }   
}