trigger BalanceTr on Transaction__c (after Insert) {
If(Trigger.isInsert)
{
if(Trigger.isAfter)
{
BalanceTrHandler.afterInsert(Trigger.New);
}}

}