trigger AccountAddressTrigger on Account (before insert,before update) {
    
    
 
        
        
        for(Account acc:trigger.new){
            
            
            if(acc.Match_Billing_Address__c==true){
                
               
                    acc.ShippingStreet=acc.BillingStreet;
                    acc.ShippingCity=acc.BillingCity;
                    acc.ShippingState=acc.BillingState;
                    acc.ShippingCountry=acc.BillingCountry;
                acc.ShippingPostalCode=acc.BillingPostalCode;
            
            
        }
        
        
    }    
    


}