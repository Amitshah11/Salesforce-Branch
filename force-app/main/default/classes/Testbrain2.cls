@istest
public class Testbrain2 {

    @istest
    public static void main(){
    
  //  BrainSquest2.Question2();
  Account a= new Account();
        a.name='mintu';
        insert a;
        Account a1= new Account();
        a1.name='mintu1';
        insert a1;
        List<contact> clist=new List<contact>();
    Contact c= new Contact();
        c.LastName='testbrain2';
        c.AccountId=a.id;
        clist.add(c);
    insert clist;
                List<Opportunity> olist=new List<Opportunity>();
        Opportunity o= new Opportunity();
        o.Name='testbrain2op';
        o.AccountId=a1.id;
        o.stagename='Closed won';
        o.CloseDate=system.today();
        olist.add(o);
    insert olist;
        
        BrainSquest2.Question2();
    
    }}