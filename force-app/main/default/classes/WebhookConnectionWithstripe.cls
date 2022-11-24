@RestResource(urlMapping='/stripe/*')
global class WebhookConnectionWithstripe {
    @HttpPost  
    global static string createAcc(){
        try{            
             System.debug('inside in webhook clsss ');
            RestRequest req = RestContext.request;	
            req.addHeader('Content-Type','application/json');           
          	string allresp=req.requestBody.tostring();
            string stringobj=allresp.replace('object', 'objectobj');
           WreapperData WreapperDataclass=(WreapperData)JSON.deserialize(stringobj, WreapperData.class); 
            Account ac= new Account();
            ac.name= WreapperDataclass.data.objectobj.name; 
            ac.stripeCustomerId__c=WreapperDataclass.data.objectobj.id;
            insert ac;
             return WreapperDataclass.data.objectobj.id; 
        }
        catch(Exception ex){ System.debug('Error --> '+ex.getMessage()+' line --> '+ex.getLineNumber());  return null;}
    }
    
     @HttpDelete 
    global static string DeleteAcc(){
        try{            
             System.debug('inside in webhook clsss ');
            RestRequest req = RestContext.request;	
            req.addHeader('Content-Type','application/json');           
          	string allresp=req.requestBody.tostring();
            string stringobj=allresp.replace('object', 'objectobj');
           WreapperData WreapperDataclass=(WreapperData)JSON.deserialize(stringobj, WreapperData.class); 
            
            string custid=(string)WreapperDataclass.data.objectobj.id;
            
            Account ac= [select id from account where stripeCustomerId__c=:custid];
            delete ac;
             return custid; 
        }
        catch(Exception ex){ System.debug('Error --> '+ex.getMessage()+' line --> '+ex.getLineNumber());  return null;}
    }
    
    public class WreapperData{
        public recorddata data{get;set;}
    }   
    
   public class recorddata {
		public objectdata objectobj {get;set;}
	}
   
    public class objectdata{
        public string id{get;set;}
        public string name{get;set;}
    }
    
}