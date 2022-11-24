public class Aura3Class {
   
    @Auraenabled
    public static string updateClosedate(id Opid, date clos){
        Opportunity op= new Opportunity();
        op.id=Opid;
        op.CloseDate=clos;
        update op;
        system.debug(clos+' '+Opid);
            return op.id;

    }
    
}