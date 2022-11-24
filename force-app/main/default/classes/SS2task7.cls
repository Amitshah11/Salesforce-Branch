public class SS2task7 {
    public static void leadproduct(){
                List<Product2> pdlist=new List<Product2>();


        for(integer i=0;i<=2;i++){
            Lead ldd=new Lead();
            ldd.LastName='Trigger 18'+i;
            ldd.Company='Cloud Analogy'+i;
            insert ldd;  
for(integer l=1;l<=5;l++){
            Product2 pd=new Product2();
    pd.Name='product'+l;
    pd.Lead__c=ldd.id;
            pdlist.add(pd);
        }
            
        }
        insert pdlist;
        
}
     
        }