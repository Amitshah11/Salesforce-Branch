global class Asynch11 implements Database.Batchable<sObject>{
        global Database.QueryLocator start(Database.BatchableContext BC){

            return Database.getQueryLocator('select id,name from lead where createddate=Last_n_days:10 and phone=null');
        }
      
       global void execute(Database.BatchableContext BC, List<lead> leadList){
             
  List<Messaging.SingleEmailMessage> maillist=new list<Messaging.SingleEmailMessage>();
       
              
   Messaging.SingleEmailMessage mail=new Messaging.SingleEmailMessage();
  
            string[] emai=new String[]{userinfo.getUserEmail()};
                String s='';
            integer i=1;
            for(lead ld:leadList){
               s+=string.valueOf(i)+' : '+ld.id+'  '+ld.name+'\n'; 
                i++;
            }
    mail.settoaddresses(emai);
    mail.setsubject('Lead list');
    mail.setplaintextbody(s);
maillist.add(mail);
        if(!maillist.isempty()){
        Messaging.sendEmail(maillist);
          
    
        }
     
       }
     
       global void finish(Database.BatchableContext BC){
       }
}