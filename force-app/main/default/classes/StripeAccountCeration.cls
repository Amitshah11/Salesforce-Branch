public with sharing class StripeAccountCeration {
  
    @AuraEnabled(cacheable=true)    
    public static boolean checkstripe(id acid){
        boolean check=false;
Account acc= [select id,stripeCustomerId__c from account where id=:acid];
if(acc.stripeCustomerId__c!=null){
    check=true;
}
return check;
    }

@AuraEnabled  
public static list<string> DisplayStripe(id acid){
    List<string> alldatastripe= new List<string>();
    
account acccustId= [select id,stripeCustomerId__c from account where id =:acid];

    Http http = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndpoint('https://api.stripe.com/v1/customers/'+acccustId.stripeCustomerId__c);
    request.setMethod('GET');
    request.setHeader('Authorization', 'Bearer sk_test_51M4ekVSGnIeNBZMNcIwODVQAXlREVakczkKYAqSIIa7ZKRbBsQrymqJsJPzEzxWYBqVe84vM6r4BDCF8vXMirezn000f2BdUuk');
   // request.setHeader('Content-Type', 'application/x-www-form-urlencoded');    
    HttpResponse response = http.send(request);
    System.debug('response.getBody() --> '+response.getBody()); 
    
    if(response.getStatusCode() == 200) {
        System.debug('Success >' + response.getBody());
    } else {
        System.debug('Error  >'+response.getStatusCode());
    }
    
    Stripedata sid=(Stripedata)JSON.deserialize(response.getBody(),Stripedata.class);
    if(sid.name==null){
        Account acc= new Account();
        acc.id=acid;
        acc.stripeCustomerId__c='';
        update acc;
    } else{
    alldatastripe.add(sid.id);
    alldatastripe.add(sid.name);
    }
    return alldatastripe;
}

@AuraEnabled
public static List<string> createStripeAcc(id acid){
    List<string> alldatastripe= new List<string>();

    account acccustId= [select id,name,phone,stripeCustomerId__c from account where id =:acid];

    Http http = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndpoint('https://api.stripe.com/v1/customers');
    request.setMethod('POST');
    request.setHeader('Authorization', 'Bearer sk_test_51M4ekVSGnIeNBZMNcIwODVQAXlREVakczkKYAqSIIa7ZKRbBsQrymqJsJPzEzxWYBqVe84vM6r4BDCF8vXMirezn000f2BdUuk');
    request.setHeader('Content-Type', 'application/x-www-form-urlencoded'); 
    request.setBody('name='+acccustId.name+'&phone='+acccustId.phone);                      
   
    HttpResponse response = http.send(request);
    System.debug('response.getBody() --> '+response.getBody());
     
    if(response.getStatusCode() == 200) {
        System.debug('Success >' + response.getStatusCode());
    } else {
        System.debug('Fail '+response.getStatusCode());
    }

    Stripedata  sid=(Stripedata)JSON.deserialize(response.getBody(),Stripedata.class);

    alldatastripe.add(sid.id);
    alldatastripe.add(sid.name);

    Account acc= [select id,stripeCustomerId__c from account where id=:acid];
acc.stripeCustomerId__c=sid.id;
update acc;

return alldatastripe;
}


public class Stripedata {
    public string id{get;set;}   
    public string name{get;set;} 
}



}