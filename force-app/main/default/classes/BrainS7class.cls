public class BrainS7class {

    public static void main(List<Agreement__c> agreeInsert){
        
        list<Agreement__c> agg=[select id, name , duration__c from Agreement__c];
        List<Payment1__c> pay= new List<Payment1__c>();
        
        for(Agreement__c agree:agreeInsert){
            
            for(integer i=0;i<integer.valueOf(agree.Duration__c);i++){
            Payment1__c p= new Payment1__c();
            p.Agreement__c=agree.id;
            p.Name=agree.Name+' payment '+(i+1);
            p.Start_date__c=date.today().addmonths(i);
            
            p.End_date__c=date.today().addmonths(i+1);
            pay.add(p);
            
            }}
        insert pay;
        
    }
    
    public static void main2(List<Agreement__c> agreeUpdate,List<Agreement__c> agreeOld){
             date dt;
    List<integer> dura;
    set<id> agid= new set<id>();
      for(Agreement__c ag1:agreeUpdate){
          agid.add(ag1.id);
   dura.add(integer.valueOf(ag1.Duration__c));
       }
    integer l=0;
        
    List<Payment1__c> pay= [select id from Payment1__c where Agreement__c in:agid offset:dura[l]]; 
  delete pay;
        
        List<Payment1__c> pay1= [select id,End_date__c from Payment1__c where Agreement__c in:agid];
    for(Payment1__c p:pay1){
         dt=p.End_date__c;
    }
    
    List<Payment1__c> insertpay= new List<Payment1__c>();
    integer j=0;
      for(Agreement__c ag2:agreeOld){
    j=0;
          if(integer.valueOf(ag2.Duration__c)<dura[l]){
              for(integer i=integer.valueOf(ag2.Duration__c)+1;i<=dura[0];i++){
                  Payment1__c p= new Payment1__c();
                  p.Agreement__c=ag2.id;
                  p.Name=ag2.name+' Payment '+i;
                  p.Start_date__c=dt.addMonths(j);
                  p.End_date__c=dt.addMonths(j+1);
					insertpay.add(p);
                      j++;
              }
          }
       }
        insert insertpay;
        l++;
    }}