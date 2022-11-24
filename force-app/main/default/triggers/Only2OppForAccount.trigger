trigger Only2OppForAccount on Opportunity (before insert) {

    
    Map<id,Opportunity> opid= new  Map<id,Opportunity>();
    for(Opportunity op:trigger.new){
       opid.put(op.AccountId,op);
    }
 
    List<Account> alist=[Select id,(select id from Opportunities) from account where id in:opid.keyset()];
    for(Account a:alist){
    if(a.id==opid.get(a.id).AccountId && a.Opportunities.size()>2){
        a.adderror('Error');
    }    
    }
    }