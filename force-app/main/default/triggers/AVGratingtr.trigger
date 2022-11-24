trigger AVGratingtr on Maintenance__c (after insert,after update) {
        set<id> cid= new set<id>();
        
        for(Maintenance__c main:trigger.new){
           cid.add(main.contact__c);               
        }
    List<contact> conList=[Select Avg_maintenance_rating__c,(Select rating__c from Maintenance__r) from contact where id in:cid];
   
    for(contact c:conlist){
              for(Maintenance__c main1:trigger.new){

                  if(c.Maintenance__r.size()==0){
                      c.Avg_maintenance_rating__c=integer.valueof(main1.rating__C);
                  }
                  else{
        c.Avg_maintenance_rating__c=(c.Avg_maintenance_rating__c*(c.Maintenance__r.size()-1)+
                                     integer.valueof(main1.rating__C))/(c.Maintenance__r.size());
                  }}
        update conlist;
    }}