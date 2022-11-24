public class Aura6Class {

    @auraEnabled(cacheable=true)
    Public static void addContact(Contact con){
        insert con;
    }
   
   @auraEnabled(cacheable=true)
    Public static integer findcontact(string username,string password){
        integer count=0;
        list<Contact> conlist=[select id from contact where username__c=:username and password__c=:password];
        for(contact con:conlist){
            count=1;
        }
        return count;
    }
    
}