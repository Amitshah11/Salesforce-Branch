public class DeleteTrHandler {
public static void beforeDelete(List<Loan__c> oldDues){
        for(Loan__c lon: oldDues){
        if(lon.Loan_amount__c!=0){
         lon.addError(' Clear the loan amount before deleting the record! ');
        }
    }
     }
    public static void afterDelete(List<Loan__c> oldDues){

    }}