public class Aura2Class {
    
    @Auraenabled
    public static List<Account> AccountList(){
        List<Account> acc= [Select id,Name from account];
        return acc;
    }  
    
    @Auraenabled
    public static List<Contact> ContactList(id accid){
        List<Contact> con= [select id,lastname from contact where AccountId =:accid];
        return con;  
    }   
    
     @Auraenabled
    public static List<Opportunity> OpportunityList(id acid){
        List<Opportunity> opp= [select id,name from Opportunity where AccountId =:acid];
        return opp;  
    }   
}