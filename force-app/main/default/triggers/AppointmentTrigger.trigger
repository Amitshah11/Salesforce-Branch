trigger AppointmentTrigger on Appointment__c (before insert) {

    map<id,Appointment__c> docid= new map<id,Appointment__c>();
        map<id,Appointment__c> patid= new map<id,Appointment__c>();

    for(Appointment__c apNew1:trigger.new){
        docid.put(apNew1.Doctor__c,apNew1);
        patid.put(apNew1.Patient__c,apNew1);
    }
    
    integer count;
    List<Doctor__c> doclist= [select name,(select id,Appointment_date__c,doctor__c from Appointments__r) from Doctor__c where id in:docid.keyset()];
    
    
    for(Doctor__c dc:doclist){
        count=0;
    for(Appointment__c ap:dc.Appointments__r){

        if(docid.get(dc.id).Appointment_date__c==ap.Appointment_date__c){
            count++;
        }   
    }
        if(count>=8){
            docid.get(dc.id).addError('8 patients are already appointed on that day with this Doctor');
        }   
}
  
        List<Patient__c> patlist=[select name,(select id,Appointment_date__c,doctor__c from Appointments__r) 
                                  from Patient__c where id in:patid.keyset()];

    for(Patient__c pt:patlist){
            for(Appointment__c ap2:pt.Appointments__r){
                if(patid.get(pt.id).Appointment_date__c==ap2.Appointment_date__c && patid.get(pt.id).doctor__c==ap2.doctor__c){
            patid.get(pt.id).addError('Patients already appointed that day with this doctor');
                }
            }           
    }   
}