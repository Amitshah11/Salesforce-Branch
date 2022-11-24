trigger DeleteAccountOppot on Opportunity (after delete) {
  if(trigger.isDelete){
        if(trigger.isAfter){
            DeleteAccountOppotHandler.afterDelete(Trigger.old);
        }
    }
}