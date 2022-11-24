public class BrainSques1 {

    public static void Favsong(){
                
       
        List<Song__c> slist= [select Name from Song__c order by Favorate__c desc];
         
        for(Song__c so:slist)
            {
            system.debug(+so.Name);
                
            }
 
         }}