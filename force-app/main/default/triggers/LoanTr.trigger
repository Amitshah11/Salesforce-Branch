trigger LoanTr on Loan__c (After insert) {
If(Trigger.isInsert)
{
if(Trigger.isAfter)
{
LoanTrHandler.afterInsert(Trigger.New);
}}
}