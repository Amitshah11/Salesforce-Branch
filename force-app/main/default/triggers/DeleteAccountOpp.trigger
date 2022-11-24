trigger DeleteAccountOpp on Account (after Delete) {

    if(trigger.isDelete){
        if(trigger.isAfter){
            DeleteAccountOppHandler.afterDelete(Trigger.old);
        }
    }
}