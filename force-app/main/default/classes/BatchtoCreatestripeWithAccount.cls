global with sharing class BatchtoCreatestripeWithAccount implements Database.Batchable<Sobject>,Database.AllowsCallouts, Database.Stateful{
    
        global database.QueryLocator start(database.BatchableContext bc){
            return database.getQueryLocator([select Id, stripeCustomerId__c,name,phone from Account where stripeCustomerId__c=null limit 5]);
        }    
        global void execute (database.BatchableContext bc, list<Account> Acclist){
            try{
                List<account> acupdate= new list<Account>();

              for(Account acc:Acclist){ 
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint('https://api.stripe.com/v1/customers');
            request.setMethod('POST');
            request.setHeader('Authorization', 'Bearer sk_test_51M4ekVSGnIeNBZMNcIwODVQAXlREVakczkKYAqSIIa7ZKRbBsQrymqJsJPzEzxWYBqVe84vM6r4BDCF8vXMirezn000f2BdUuk');
            request.setHeader('Content-Type', 'application/x-www-form-urlencoded'); 
            request.setBody('name='+acc.name+'&phone='+acc.phone);                      
           
            HttpResponse response = http.send(request);
            System.debug('response.getBody() --> '+response.getBody());
             
            if(response.getStatusCode() == 200) {
                System.debug('Success >' + response.getStatusCode());
            } else {
                System.debug('Fail '+response.getStatusCode());
            }
            Stripedata  sid=(Stripedata)JSON.deserialize(response.getBody(),Stripedata.class);
            Account ac= new Account();
            ac.id=acc.id;
            ac.stripeCustomerId__c=sid.id;
            acupdate.add(ac);
           
        }

        update acupdate;}
        catch(exception e){
system.debug('Exception error '+e.getMessage());
        }

    }

      global void finish(database.BatchableContext bc){
        }

        global class Stripedata {
            public string id{get;set;}   
            public string name{get;set;} 
        }

}