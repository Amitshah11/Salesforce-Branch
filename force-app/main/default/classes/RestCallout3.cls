public class RestCallout3 {
    public static void rest3(){
         Http http2 = new Http();
		HttpRequest request2 = new HttpRequest();
		request2.setEndpoint('https://api.stripe.com/v1/customers?limit=20');
		request2.setMethod('GET');
		request2.setHeader('Authorization', 'Bearer sk_test_51M4ekVSGnIeNBZMNcIwODVQAXlREVakczkKYAqSIIa7ZKRbBsQrymqJsJPzEzxWYBqVe84vM6r4BDCF8vXMirezn000f2BdUuk');
		request2.setHeader('Content-Type', 'application/json');
        		HttpResponse response2 = http2.send(request2); 
                    wrapData getdatainmap=(wrapData)JSON.deserialize(response2.getBody(), wrapData.class);
        system.debug('Code :'+response2.getStatusCode());
                system.debug('map :'+getdatainmap.data.size());    
        
        
  //     for(integer i=0;i<getdatainmap.data.size();i++){
   //         System.debug(getdatainmap.data[i].name);
    //    }
    for( dataclass  ref:getdatainmap.data){
          Account acc=new Account(name=ref.name,stripeCustomerId__c=ref.id);
            insert acc;   
       }    
    }
    
    public class wrapData{
        public list<dataclass> data{get;set;}
    }
     
   public class dataclass{
        public string name{get;set;}
               public string id{get;set;}

       
    }    
}