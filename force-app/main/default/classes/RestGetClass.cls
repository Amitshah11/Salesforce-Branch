@RestResource(urlMapping='/showAccounts/*')

global class RestGetClass {
@httpGet
    global static Account getAccount(){
        Account accList;
          Restrequest req=RestContext.request;
         RestResponse res=RestContext.response;
        string acid=req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        try{
          accList=[select id,name,phone,website from account where id=:acid]; 
            return accList;
        }
        catch(exception ex){
            system.debug('Error > '+ex.getMessage()+' at line : '+ex.getLineNumber());
        }
        return accList;
    }
    
    @httpPut
    global static string insertAcc(string name,string phone, string Accnumber){
        
        Account acc= new Account();
        acc.name=name;
        acc.phone=phone;
        acc.AccountNumber=accnumber;
        insert acc;
        
        Account acupdate=new Account();
        acupdate.id=acc.id;
        acupdate.name='ak shah';
        update acupdate;
        
        return acupdate.id;
        
        
    }
    
     @httpDelete
    global static string deleteAcc(){
     
        Restrequest req=RestContext.request;
         RestResponse res=RestContext.response;
        string acnum=req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account accreq=[select id,name from account where AccountNumber=:acnum];
        delete accreq;
        return 'Deleted Success';
    } 
}