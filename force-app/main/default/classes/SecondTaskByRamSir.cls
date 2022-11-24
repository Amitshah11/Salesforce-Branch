public with sharing class SecondTaskByRamSir 
{
   @auraEnabled(cacheable=true)
   public static List<Opportunity> oppList()
   {
      List<Opportunity> oplist=[select id,name,closedate,amount,account.name,stagename from Opportunity where accountid!=null order by name];
      return oplist;
   }
   
   @auraEnabled
   public static List<Opportunity> sortByStage(List<string> stage)
   {

      List<Opportunity> opplist=[select id,name,closedate,amount,account.name,stagename from Opportunity where stagename in:stage and accountid!=null order by name];
      return opplist;
   }

   @auraEnabled
   public static void deleteOpp(id oppid)
   {
      List<Opportunity> oppdel=[select id from Opportunity where id =:oppid];
      delete oppdel;
   }


   @auraEnabled(cacheable=true)
   public static List<string> StageList()
   {
      List<string> stageList= new List<String>();
      String objectName = 'Opportunity';
      String fieldName ='StageName';
      Schema.SObjectType s = Schema.getGlobalDescribe().get(objectName) ;
      Schema.DescribeSObjectResult r = s.getDescribe() ;
      Map<String,Schema.SObjectField> fields = r.fields.getMap() ;
      Schema.DescribeFieldResult fieldResult = fields.get(fieldName).getDescribe();
      List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
      for( Schema.PicklistEntry pickListVal : ple)
      {
         stageList.add(pickListVal.getValue());
      }  
   return stageList;
   }


   @auraEnabled
   public static boolean changeTheStage(string opid, string stage)
   {
      boolean check = false; 
      List<Opportunity> opplist=[select id,stagename from Opportunity where id =:opid];
      for(Opportunity op:opplist){
         if(op.stagename==stage){
        check=false;
         }
         else{
            op.stagename=stage;
            update opplist;
            check=true;        
         }
      }
      return check;
   }
}