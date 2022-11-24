trigger DeleteTr on Loan__c (before delete, after delete) {

    If(Trigger.isDelete)
{
If(Trigger.isBefore)
{
DeleteTrHandler.beforeDelete(Trigger.Old);
}
    else if(Trigger.isAfter){
        DeleteTrHandler.afterDelete(Trigger.Old);
 }
}}