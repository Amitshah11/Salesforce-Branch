public class BrainRihan {

    public static void main(){
        
        
      List<Campaign> cmp=[select id,Total_member__c,(select id from CampaignMembers) from Campaign];  
        for(Campaign c:cmp){
            
            c.Total_member__c=c.CampaignMembers.size();
            
        }update cmp;
        
        
        
    }
}