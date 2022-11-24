public class SS2task8 {

   
    public static void task8(){
      List<AggregateResult> ld=[select owner.name from lead group by owner.name having count(id)>20];
for(AggregateResult l:ld){
            
        system.debug(l);
           
}
    }
}