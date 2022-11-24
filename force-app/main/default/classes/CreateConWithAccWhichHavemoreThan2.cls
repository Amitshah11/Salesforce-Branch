public class CreateConWithAccWhichHavemoreThan2 {
    public static void addcon(){
        
         map<id,list<id>> oplisize=new  map<id,list<id>>();
        
        List<OpportunityLineItem> oliAclist=[select id,Opportunity.accountId from OpportunityLineItem where Opportunity.accountId!=null];
        for(OpportunityLineItem oppline:oliAclist){ 
            if(!oplisize.containskey(oppline.Opportunity.accountId)){
                oplisize.put(oppline.Opportunity.accountId, new List<id>());
            }
            oplisize.get(oppline.Opportunity.accountId).add(oppline.id);     
        }
        
    set<id> acidforcon=new set<id>();
        for(id ids:oplisize.keyset()){
            if(oplisize.get(ids).size()>=2){
            acidforcon.add(ids); 
            }
        }
        
        List<Account> acname=[select id,name from account where id in:acidforcon];
        List<contact> conList = new List<contact>();
        for(Account ac:acname){
            contact con= new contact();
            con.accountid=ac.id;
            con.lastname=ac.name;
            conList.add(con);
            
        }
        insert conList;
        
    }
}