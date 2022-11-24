trigger TriggerQ20 on Contact (before insert,before update) {
  
     List<Id> accIds = new List<Id>();
        for(Contact con: trigger.new){
            if(con.AccountId != null){
               accIds.add(con.AccountId);
            }
        }
        List<Account> accList =[Select ShippingAddress,ShippingStreet,ShippingPostalCode,ShippingCity,ShippingState,ShippingCountry 
                    FROM Account Where ID IN: accIds];
        for(Account acc: accList){
            for(Contact con: trigger.new){
                if(con.AccountId == acc.Id){
                    con.MailingStreet=acc.ShippingStreet;
                  con.MailingPostalCode=acc.ShippingPostalCode;
                    con.MailingCity=acc.ShippingCity;
                    con.MailingState=acc.ShippingState;
                    con.MailingCountry=acc.ShippingCountry;                   
                }
            }
        }     
        update accList;
}