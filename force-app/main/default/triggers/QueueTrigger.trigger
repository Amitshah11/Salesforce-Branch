trigger QueueTrigger on Account (after insert) {

   System.enqueueJob(new QueueWithTrigger(trigger.new));
    
    
}