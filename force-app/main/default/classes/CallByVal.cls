public class CallByVal {

    public void mainmethod(){
        string name='Amit shah';
        system.debug(name);
        Call(name);
               system.debug(name);        
    }
 
    public void Call(string newName){
        
         newName='Aman';
        system.debug(+newName);
        
    }
     public void Ref(){
        Account a= new Account();
         a.Website='abcd.com';
         a.Name='Amit';
                system.debug(a);
         CallR(a);
                         system.debug(a);

    }
    public void CallR(Account a){
        
         a.Website='Salesforce.com';
        a.Name='Cloud';
        
    }
}