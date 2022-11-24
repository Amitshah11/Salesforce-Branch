public class SS2task9 {

    
    public static void task9(){
            List<id> conid=new List<id>();
        List<string> conname= new List<string>();
        List<Event_Participant__c> evpartlist=new List<Event_Participant__c>();

  Event__c ev=new Event__c(Name='Indipendance day', Event_Date_Time__c	=datetime.newInstance(2022, 08, 15, 13, 30, 00));
        insert ev;
        
        List<Contact> conlist=[Select id,name from Contact limit 10];
for(Contact co:conlist){
    conname.add(co.name);
        conid.add(co.id);   
    }
        
        for(integer i=0;i<=9;i++){
                    Event_Participant__c epobj=new Event_Participant__c();
					epobj.Contact__c=conid[i];
            epobj.name=conname[i];
            					epobj.Event__c=ev.id;
            if(i<=3){
                epobj.About_Contact__c='Attendee Contact';
            }
            else if(i>=4 && i<=7){
                epobj.About_Contact__c='Presenter Contact';
            }
            else if(i>7){
                epobj.About_Contact__c='Organizer Contact';
            }
            evpartlist.add(epobj);
            
        }
        insert evpartlist;    
        
    }    
}