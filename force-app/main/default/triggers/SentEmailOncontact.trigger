trigger SentEmailOncontact on Contact (after insert,after update) {

        
        Sendemailoncontacthandler.afterinsert(trigger.new);
        
   
}