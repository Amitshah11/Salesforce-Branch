public with sharing class Lwc7Class {
   
@AuraEnabled


  public static integer findcontact(string username,string password){
            integer count=0;
            list<Contact> conlist=[select id from contact where username__c=:username 
                                            and password__c=:password];
            for(contact con:conlist){
                count=1;
            }
            return count;
        }
        
    }