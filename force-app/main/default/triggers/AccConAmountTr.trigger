trigger AccConAmountTr on Contact (After insert,after update,after delete, after undelete) {
If(Trigger.isInsert)
{
if(Trigger.isAfter)
{
    AccConAmountTrHandler.afterInsert(Trigger.New);

}}

    If(Trigger.isupdate)
{
if(Trigger.isAfter)
{
    AccConAmountTrHandler.afterUpdate(Trigger.New, Trigger.old);

}}
    
  If(Trigger.isdelete)
{
if(Trigger.isAfter)
{
        AccConAmountTrHandler.afterDelete(Trigger.old);    
}}  
    If(Trigger.isUndelete)
{
    if(Trigger.isAfter){
        AccConAmountTrHandler.afterUnDelete(Trigger.new);    
}  
}}