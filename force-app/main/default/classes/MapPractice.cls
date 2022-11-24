public class MapPractice {
    
    public static void main(){
        
        /*      https://www.youtube.com/watch?v=COYgLM31F1k     */    
        
        // how many contacts account have
        /*    
map<id,Account> acmap=new map<id,Account>();

List<Account> aclist=[select id,name,phone,website from account limit 5];
for(Account ac:aclist){
acmap.put(ac.id,ac);
}   


system.debug(acmap);  



*/    
        
        // Get all details of the contacts by related account id
        
        /*  map<id,contact> acmap=new map<id,contact>();

List<contact> conlist=[select accountid,name from contact limit 10];
for(contact con:conlist){
if(con.Accountid!=null){
acmap.put(con.Accountid,con);
}   }
system.debug(acmap);   

for(id lid:acmap.keyset()){
system.debug(lid+'   '+acmap.get(lid));
}  
*/
        
        // get the phone number of the contact with name      
        /*       
map<String,Contact> acmap=new map<String,Contact>();

List<contact> conlist=[select Account.name,phone from contact limit 20];
for(contact con:conlist){
if(con.phone!=null){
acmap.put(con.Account.name,con);
}   }
system.debug(acmap);   

for(String name:acmap.keyset()){
system.debug(name+'   '+acmap.get(name));
}
*/
        
        // give query inside map to get account details if phone is not null. if we gives query inside map, keyset will be id everytime
        /*
Map<id, Account> acmap = new Map<id, Account>([SELECT phone, Name FROM Account LIMIT 50]);
for(string id:acmap.keyset()){
if(acmap.get(id).phone!=null){
system.debug(id+'   '+acmap.get(id));
}}
*/
        
        /*       Map<id, List<OpportunityContactRole>> acmap = new Map<id, List<OpportunityContactRole>>();
List<Opportunity> aclist=[select id,(select id,contact.name from OpportunityContactRoles) from Opportunity];
for(Opportunity ac:aclist){
if(ac.OpportunityContactRoles.size()!=0){
acmap.put(ac.id, ac.OpportunityContactRoles);
}}
for(id i:acmap.keyset()){
system.debug(i+'   : '+acmap.get(i));
}   */ 
        
   /*     map<id,list<contact>> acmap=new map<id,list<contact>>();
        
        List<Account> aclist=[select id,name,(select id,name, phone from contacts) from Account limit 10];
        for(Account ac:aclist){
            for(Contact con:ac.contacts){
            if(!acmap.containskey(ac.id)){
                acmap.put(ac.id,new List<contact>());
            }
            acmap.get(ac.id).add(con);
            
            }}
        for(id id:acmap.keyset()){
            system.debug(id+'  : '+acmap.get(id));
            
        }*/
        
        try{
            List<contact> conList = new lIst<contact>();
            Map<Id, List<contact>> conMap = new map<Id, List<contact>>();
            conList = [SELECT  Id, LastName, accountId FROM contact WHERE AccountId != null]; 
            for(contact conobj :conList ){
                if(!conMap.containskey(conobj.AccountId)){ 
                                        conMap.put(conobj.AccountId, new List<contact>{conobj});

                   /* List<contact> connewList = new List<contact>();
                   connewList = conMap.get(conobj.AccountId);
                    connewList.add(conobj);
                    conMap.put(conobj.AccountId, connewList); */
                }
                                    conMap.get(conobj.AccountId).add(conobj);

            } 
            System.debug(' key Set -> '+conMap.keySet());
            for(Id obj : conMap.keySet()) {
                System.debug(obj+' Id -> '+conMap.get(obj));
            } 
        }catch(Exception ex){
            System.debug('Error --> '+ex.getMessage()+' at line --> '+ex.getLineNumber());
        }
    }
    }