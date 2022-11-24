global class BatchPractice2 implements Database.Batchable<Sobject> {
    public  string details='';
    global database.QueryLocator start(database.BatchableContext bc){
        return database.getQueryLocator([select Id, birthdate,lastname from Contact limit 20]);
    }    
    global void execute (database.BatchableContext bc, list<Contact> con){
        
        System.debug('Inside execute method');
        for(contact co: con){
            System.debug('IDs> '+co.id);
            co.lastname =co.lastname+' b';
            this.details +=co.id+'\n';
        }
        Database.update(con, false);
        if(this.details!=''){        
            Messaging.SingleEmailMessage msg= new Messaging.SingleEmailMessage();
            string[] email= new String[]{'amit.shah@cloudanalogy.com'};
             msg.setToAddresses(email);
            msg.setPlainTextBody(this.details);
            msg.setSubject('updated contact ids');
            Messaging.sendEmail(new Messaging.SingleEmailMessage[]{msg});

    }
                system.debug('in execute '+this.details);

         
       
    }
    global void finish(database.BatchableContext bc){
        
      Messaging.SingleEmailMessage msg= new Messaging.SingleEmailMessage();
            string[] email= new String[]{'amit.shah@cloudanalogy.com'};
             msg.setToAddresses(email);
            msg.setPlainTextBody('Email from finish method'); 
            msg.setSubject('updated contact ids');
            Messaging.sendEmail(new Messaging.SingleEmailMessage[]{msg});

    }}