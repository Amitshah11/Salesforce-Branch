public with sharing class RestCallout2 {
    public static void rest2(string nam,string phon){
        
        System.debug(' inside in class of RestCallout2');
        Http http1 = new Http();
        HttpRequest request1 = new HttpRequest();
        request1.setEndpoint('https://api.stripe.com/v1/customers');
        request1.setMethod('POST');
        request1.setHeader('Authorization', 'Bearer sk_test_51M4ekVSGnIeNBZMNcIwODVQAXlREVakczkKYAqSIIa7ZKRbBsQrymqJsJPzEzxWYBqVe84vM6r4BDCF8vXMirezn000f2BdUuk');
        request1.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        request1.setBody('name='+nam+'&phone='+phon);                      
        
        HttpResponse response1 = http1.send(request1);
        System.debug('RReturn    --> '+response1);
        System.debug('response1.getBody() --> '+response1.getBody());
        
        
        if(response1.getStatusCode() == 200) {
            System.debug('201 ' + response1.getBody());
        } else {
            System.debug('else --> 201 '+response1.getStatusCode());
        }
        
        
                GetID Gid=(GetID)JSON.deserialize(response1.getBody(),GetID.class);
                System.debug(' cuistomer Id --> '+Gid.id);
                        System.debug(' cuistomer Name --> '+Gid.name);



        
        Http http3 = new Http();
        HttpRequest request3 = new HttpRequest();
        request3.setEndpoint('https://cloudanalogy-2e2-dev-ed.my.salesforce.com/services/oauth2/token?username=amit.shah@cloudanalogy.com&password=113920@CA36swNOiKW1hqz2BAAYXj6im2h&grant_type=password&client_id=3MVG9wt4IL4O5wvLjLqDgVYD0d62Ks8BMlv5CS0e39fbt6JOinVag8IAK6j.OkZe8f8xHHhG38lY4E9I53zfI&client_secret=56D6A60B2322DBEA7657AB2A69E16669F4ECB050FD7D37953A7139F6CE916D96');
        request3.setMethod('POST');
        HttpResponse response3 = http3.send(request3);
        system.debug('response :'+response3.getBody());
         
        Getallresponse allresponse=(Getallresponse)JSON.deserialize(response3.getBody(),Getallresponse.class);
        
        if(allresponse.access_token!=null){
            Http http4 = new Http();
            HttpRequest request4 = new HttpRequest();
            request4.setEndpoint('https://cloudanalogy-2e2-dev-ed.my.salesforce.com/services/data/v42.0/sobjects/account');
            request4.setMethod('POST');
            request4.setBody('{"name":"'+Gid.name+'","stripeCustomerId__c":"'+Gid.id+'"}');
          
            request4.setHeader('Content-Type','application/json');
            request4.setHeader('Authorization','Bearer '+allresponse.access_token);
            HttpResponse response4= http4.send(request4);  
            System.debug(response4.getBody()); 
        }   
    }
   
    public class GetID {
        public string id{get;set;}   
                public string name{get;set;}      

    }
    public class Getallresponse {
        public string  access_token{get;set;}
    }
}