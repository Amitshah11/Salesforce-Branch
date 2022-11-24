trigger ContactTR on Contact(after update) {
 If(Trigger.isUpdate)
{
 if(Trigger.isAfter)
{
ContactTRHandler.afterUpdate(Trigger.New, Trigger.old);
}}}