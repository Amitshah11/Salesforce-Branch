trigger TriggerQ17 on Contact (before insert,before update) {
    
    set<id> userid=new set<id>();
        userid.add(userinfo.getUserId());
    
    List<User> use = [SELECT Country FROM User where id in:userid];
    
    for(User us:use){
    for(contact con:trigger.new){
          
        if(con.Same_country_as_user__c==true || con.MailingCountry==us.country){
            con.adderror('Not allowed same country as user');      
        }     
    }
    }
}