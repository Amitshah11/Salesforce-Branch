trigger TriggerQ18 on Opportunity (before insert,before update) {
   Set<id> acid=new set<id>();
        for(Opportunity opp:trigger.new){
           acid.add(opp.Accountid);
            }
            
    List<Account> acc= [select name,(Select id from Opportunities 
                               where stagename='Closed won') from account where id in: acid and working_in__c='ASIA']; 
    for(account a:acc){   
    for(Opportunity opp1:trigger.new){
      if(a.Opportunities.size()>=2){           
            opp1.adderror('Can not create or update opp bcz parent acc have 2 or more closed won opp and acc woring in ASIA');  
          }
      }           
    }}