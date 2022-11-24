public class BrainNitin2 {

    public static void main(){
        List<decimal> inter= new List<decimal>();
       List<Daily_status__C> dslist=[select time_interval__C from Daily_status__C ]; 
       
        for(Daily_status__C ds:dslist){

inter.add(ds.time_interval__C);     
        }
        inter.sort();
       
    List<Daily_status__C> daily=[select contact__r.name,time_interval__C from Daily_status__C];
    for(Daily_status__C d:daily){
        if(d.time_interval__C==inter[0]){
            system.debug('Minimum time '+d.contact__r.name +' '+d.Time_interval__c+' Minutes');
        }
        if(d.time_interval__C==inter[inter.size()-1]){
            system.debug('Maximum time '+d.contact__r.name +' '+d.Time_interval__c+' Minutes');
        }
    }}
    
}