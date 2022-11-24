public class Sendemailoncontacthandler {
    
    
    public static void afterinsert(List<contact> newInsert){
        List<Messaging.SingleEmailMessage> maillist=new list<Messaging.SingleEmailMessage>();
        for(Contact con:newInsert){
            
            
            Messaging.SingleEmailMessage mail=new Messaging.SingleEmailMessage();
            string sub='test subject for mail';
            string body='test body for mail';
            string[] emaiarr=new String[]{con.Email};
                mail.settoaddresses(emaiarr);
            mail.setsubject(sub);
            mail.setplaintextbody(body);
            maillist.add(mail);
            if(!maillist.isempty()){
                Messaging.sendEmail(maillist);            
                
            }}}
}