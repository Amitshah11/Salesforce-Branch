public class StripeApi {
    
    
    public static void insertRecordinStrip(string nam,string phon){
        
         Http http1 = new Http();
        HttpRequest request1 = new HttpRequest();
        request1.setEndpoint('https://api.stripe.com/v1/customers');
        request1.setMethod('POST');
        request1.setHeader('Authorization', 'Bearer sk_test_51M4ekVSGnIeNBZMNcIwODVQAXlREVakczkKYAqSIIa7ZKRbBsQrymqJsJPzEzxWYBqVe84vM6r4BDCF8vXMirezn000f2BdUuk');
        request1.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        request1.setBody('name='+nam+'&phone='+phon); 
         HttpResponse response1 = http1.send(request1); 
         setData setDataClass =(setData)JSON.deserialize(response1.getBody(),setData.class); 
        System.debug('setData id -> '+setDataClass.id);
         System.debug('setData Name -> '+setDataClass.name);
        Account accobj = new Account();
        accobj.Name = setDataClass.name;
         accobj.stripeCustomerId__c = setDataClass.id;
        
        insert accobj;
          
    }
    
    public class setData{
        public String id{get;set;}
        public String balance{get;set;}
        public String email{get;set;}
        public String name{get;set;}
        public String phone{get;set;}
  
    }
     

}