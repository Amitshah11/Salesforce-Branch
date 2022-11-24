trigger BatchTrigger on Contact (before insert) {

    database.executeBatch(new BatchWithTrigger());
    
    
   
}