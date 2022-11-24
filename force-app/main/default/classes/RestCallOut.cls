public class RestCallOut {
    public static void restApi(){
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://cloudanalogy-2e2-dev-ed.my.salesforce.com/services/oauth2/token?username=amit.shah@cloudanalogy.com&password=113920@CA36swNOiKW1hqz2BAAYXj6im2h&grant_type=password&client_id=3MVG9wt4IL4O5wvLjLqDgVYD0d62Ks8BMlv5CS0e39fbt6JOinVag8IAK6j.OkZe8f8xHHhG38lY4E9I53zfI&client_secret=56D6A60B2322DBEA7657AB2A69E16669F4ECB050FD7D37953A7139F6CE916D96');
        request.setMethod('POST');
        HttpResponse response = http.send(request);
        system.debug('response :'+response.getBody());
        
        Getallresponse allresponse=(Getallresponse)JSON.deserialize(response.getBody(),Getallresponse.class);
        
        if(allresponse.access_token!=null){
            Http http2 = new Http();
            HttpRequest request2 = new HttpRequest();
            request2.setEndpoint('https://cloudanalogy-2e2-dev-ed.my.salesforce.com/services/data/v42.0/sobjects/account');
            request2.setMethod('GET');
        //    request2.setBody('{"LastName":"Aman","Phone":"37729982"}');
            request2.setHeader('Content-Type','application/json');
            request2.setHeader('Authorization','Bearer '+allresponse.access_token);
            HttpResponse response2 = http2.send(request2);
            
            System.debug(response2.getBody());
            
            
                    GetconId conId=(GetconId)JSON.deserialize(response2.getBody(),GetconId.class);
            
             for(allnames ref:conId.recentItems){
            System.debug('Name : '+ref.name+' id : '+ref.id);
        }
    }
        
        
  /*      Http http3 = new Http();
        HttpRequest request3 = new HttpRequest();
        request3.setEndpoint('https://cloudanalogy-2e2-dev-ed.my.salesforce.com/services/data/v42.0/sobjects/Account/0015i00000TjxPAAAZ');
        request3.setMethod('GET');
        //    quest3.setMethod('POST');
        //     request3.setMethod('PATCH');
        //      request3.setBody('{"LastName":"Bharat bro","Phone":"37729982"}');
        
        request3.setHeader('Content-Type','application/json');
        request3.setHeader('Authorization','Bearer '+allresponse.access_token);
        HttpResponse response3 = http3.send(request3);
        
        if (response3.getStatusCode() == 200) {
            System.debug(response3.getStatusCode() + ' ' + response3.getStatus()+'  '+response3.getBody());
        } else {
            System.debug(response3.getBody());
        }   */     
        }
        
        


    public class Getallresponse {
        public string  access_token{get;set;}
    }
    public class GetconId {
        public List<allnames>  recentItems{get;set;}   
    }
          public class allnames {
        public string  name{get;set;}  
                      public string  id{get;set;}      

    
    }
}