public class LightningSheetClass {
    
    @AuraEnabled
    public static String createAccount(Account ac){
        insert ac;
      return ac.id;
    }
}