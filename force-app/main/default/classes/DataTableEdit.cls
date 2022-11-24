public with sharing class DataTableEdit {
    @auraEnabled(cacheable=true)
    public static List<Contact> contactTable(){
        
        List<Contact> Conlist= [select id,FirstName,LastName from Contact order by createddate desc limit 30];
        return Conlist;
        
    }
    
   @auraEnabled
        public static void updateContact(object conid){
          List<Contact> colist=(List<Contact>) JSON.deserialize(json.serialize(conid), List<Contact>.class);
            update colist;
        }
    
}