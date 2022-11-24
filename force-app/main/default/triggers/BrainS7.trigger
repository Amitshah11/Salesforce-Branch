trigger BrainS7 on Agreement__c (after insert, after update) {

    if(trigger.isInsert){
    BrainS7class.main(trigger.new);
    }
    
     if(trigger.isUpdate){
    BrainS7class.main2(trigger.new,trigger.old);
    }
    
}