public class TestClass {
    

    public static void test(){
        List<Account> accList = new List<Account>();
          for(integer i=1;i<=5;i++){
                  List<Contact> conList = new List<Contact>();

            Account acc = new Account();
              acc.Name='Aman'+i;
              acc.Phone='100446448';
                accList.add(acc);
              
                     for(integer j=1;j<=5;j++){
                         Contact con = new Contact();
                         con.FirstName='Amit';               
                            con.LastName='kumar'+j;
                            con.AccountId=acc.Id;                         
                             conList.add(con);
                       }
                          insert conList;                        
          }
                insert accList;   
    }}