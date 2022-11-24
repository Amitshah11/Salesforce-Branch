public class SSScripts {

   //Contact having same name as current user 
   
   /*List<contact> con=[select Name,Email from contact];
for(contact c:con){
    
    if(c.email==userinfo.getUserEmail())  {
    system.debug(c.Name);
    }}*/
    
        //current user__System.debug(+UserInfo.getUserEmail()+' '+UserInfo.getFirstName()+' '+UserInfo.getLastName()+' '+UserInfo.getOrganizationName());

    
   //Name reverse 
    /*List<Account> nam=[Select Name from Account limit 20];
for(Account ac:nam){
    String n=ac.Name;
    system.debug(n.reverse());
}
*/
    
    // SOQL task 10---- select name from Account where Industry ='Transportation' and CreatedBy.Alias ='AShah';
     
    
  //  Account having more than 2 opp which have closed won stagename
    
    /*list<Account> alist=[select name,id,(select id from Opportunities where stagename='closed won') from account];
for(Account a:alist){
    if(a.Opportunities.size()>=2){       
        system.debug(a.name);
   }    
}
*/ 
    /*
      List<Account> ac=[select name,(select name,closedate from Opportunities where stagename='closed won') from account];
for(Account a:ac){
    for(Opportunity o:a.Opportunities){
    if(a.Opportunities.size()>=5 && o.closedate>date.newInstance(2022, 07, 27) && o.closedate<date.newInstance(2022, 08, 27)){
     system.debug(a.name);
    }
    }
  
}*/
 
    /*List<Contact> co=[select id from contact where name like '%Test%'];
delete co;*/
    
}