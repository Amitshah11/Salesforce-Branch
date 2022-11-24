public class LoanTrHandler {
public static void afterInsert(List<Loan__c>  newList)
{        
List<Loan_Detail__c> InsertLd=new List<Loan_Detail__c>();
For(Loan__c l: newList)
{
Loan_Detail__c lo= new Loan_Detail__c();
    lo.Loan__c=l.Id;
    lo.Bank_Account__c=l.Bank_Account__c;
    lo.Name=l.Name;

InsertLd.add(lo);
}
If(!InsertLd.isEmpty())
{
insert InsertLd;
}}
}