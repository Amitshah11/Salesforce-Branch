trigger QueueablePracticeTrigger on Account (after insert) {

System.enqueueJob(new queueablePractice(trigger.new));
    
}