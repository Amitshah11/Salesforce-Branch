public class PracticePlaceClass {
  @Auraenabled
    public static List<Account> createListOfAcc(){
        List<Account> AccList= [Select id,Name from account];
        
        return AccList;

    }
    
    @Auraenabled
    public static List<Contact> createListOfCon(){
        List<Contact> ConList= [Select id,Name from Contact];
        
        return ConList;

    }
}