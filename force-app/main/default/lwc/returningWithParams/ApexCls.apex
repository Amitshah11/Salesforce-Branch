public with sharing class ApexClass {


    @Auraenabled(cacheable=true)
    public static List<Account> AccountList(string search){
        List<Account> acc= [Select id,Name from account where name like:search];
        return acc;
    }  