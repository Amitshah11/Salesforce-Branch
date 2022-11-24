public class LightContactClass {

   @Auraenabled
    public static Map<String,string> createListOfAcc(){
        Map<String,string> conmap= new Map<string,string>();
        for(Account a:[Select id,Name from account limit 15]){
         conmap.put(a.id, a.name);   
        }
        return conmap;

    }
@Auraenabled
       public static String Insertcontact(Contact con){
           system.debug('con-- '+con);
              insert con;
           return con.id;
       }
}