public class ContactTRHandler {

public static void afterUpdate(List<Contact> newList, List<Contact>  oldList)
{
    string phoneNo;
set<id> sid=new set<id>();
for(Contact con : newList)
{for(Contact con2 : oldList)
{
If(con.Phone!= con2.Phone)
{phoneNo=con.Phone;
sid.add(con.AccountId);
}
}}
List<Account> accQuery=[Select Phone from Account where id IN : sid];
for(Account acc: accQuery)
{
acc.Phone=phoneNo;
}
update accQuery;
}
}