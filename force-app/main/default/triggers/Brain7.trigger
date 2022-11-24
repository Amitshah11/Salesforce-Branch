trigger Brain7 on Agreement__c (after update) {

List<date> lastdate;
    List<integer> dura;
    set<id> agid= new set<id>();
      for(Agreement__c ag1:trigger.new){
          agid.add(ag1.id);
       }
    
    
    
    
    
    
    
}