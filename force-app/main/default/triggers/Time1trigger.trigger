trigger Time1trigger on Time1__c (after insert,after update) {
    
    Set<id> conid= new Set<id>();
    for(Time1__c t1:trigger.new){          
            conid.add(t1.Contact__c);                  
    }
    List<Contact> UpdateConList= new List<Contact>();
    
    List<Time1__c> timlist=[Select id,Enddate__C from Time1__c where contact__c in:conid and Name like 'a%'];
    for(Time1__c t:timlist){
        for(Time1__c t2:trigger.new){   
            if(t2.id==t.id && t2.EndDate__c.month()==date.today().month()-1){
                Contact updateCon= new Contact();
                updateCon.id=t.contact__C;
                updateCon.LastName=t2.name; 
                UpdateConList.add(updateCon);
            }    
        }
    }
    update UpdateConList;  
}


/*
With map
Map<id,Time1__c> conid=new Map<id,Time1__c>(); 

    for(Time1__c t1:trigger.new){          
            conid.put(t1.Contact__c,t1);                  
    }
    List<Contact> UpdateConList= new List<Contact>();
    
    List<Time1__c> timlist=[Select id,Enddate__c,contact__c from Time1__c where contact__c in:conid.keyset() and Name like 'a%'];
    for(Time1__c t:timlist){
            if(conid.get(t.contact__c).id==t.id && conid.get(t.contact__c).EndDate__c.month()==date.today().month()-1){
                Contact updateCon= new Contact();
                updateCon.id=t.contact__C;
                updateCon.LastName=conid.get(t.contact__c).name; 
                UpdateConList.add(updateCon);              
        }
    }
    update UpdateConList;

*/