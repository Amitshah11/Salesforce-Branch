public class DeleteContact {
    public static void deleteCon(){
        List<Contact> conlist= [select id from contact where name like 'A%' and account.name like 'B%'];
        
        delete conlist;
        
    }
}