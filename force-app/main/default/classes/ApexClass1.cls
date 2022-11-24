public with sharing class ApexClass1 {
    @Auraenabled(cacheable=true)
    public static List<Account> AccountList(string search){
        string name1='%'+search+'%';
        List<Account> acc= [Select id,Name from account where name like:name1];
        return acc;
    }

 @Auraenabled(cacheable=true)
    public static List<Contact> ContactList(string acid){
      
        List<contact> con= [Select id,Name from Contact where accountid =:acid];
        return con;
    }
 @Auraenabled(cacheable=true)
    public static List<Opportunity> OpportunityList(string acid){
      
        List<Opportunity> opp= [Select id,Name from Opportunity where accountid =:acid];
        return opp;
    }
}