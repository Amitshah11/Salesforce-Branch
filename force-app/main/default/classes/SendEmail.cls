public class SendEmail {

    public static void emailsend(){
        
        
        List<Messaging.SingleEmailMessage> maillist=new list<Messaging.SingleEmailMessage>();
        
string[] em=new string[]{'amit.shah@cloudanalogy.com'};
   Messaging.SingleEmailMessage mail=new Messaging.SingleEmailMessage();
    string sub='test subject for mail';
string body='test body for mail';
    mail.settoaddresses(em);
    mail.setsubject(sub);
    mail.setplaintextbody(body);
maillist.add(mail);
        
        if(!maillist.isempty()){
        Messaging.sendEmail(maillist);
        }
    
    
    }
    
}