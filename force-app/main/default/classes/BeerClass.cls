public with sharing class BeerClass {

@AuraEnabled(cacheable=true)

public static list<Beer__c> getBeer(){
List<Beer__c> bc= [select id,name,price__c,Alcohol__c from Beer__c];
return bc ;

}

@AuraEnabled

public static list<Beer__c> searchBeer(string search){
string nam=search+'%';
List<Beer__c> bc= [select id,name,price__c,Alcohol__c from Beer__c where name like:nam];
return bc;

}

@AuraEnabled
public static void deleteBeer(id lst){
System.debug(' inside in methods '+lst);

List<Beer__c> del= [select id from Beer__c where id =:lst];
System.debug('size --> '+ del);
delete del;

}
}