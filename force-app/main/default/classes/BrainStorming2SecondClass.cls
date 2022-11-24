public class BrainStorming2SecondClass {
    
    Public static void main(List<Flight_passenger__c> NewFlight){
        map<id,Flight_passenger__c> FlightMap= new  map<id,Flight_passenger__c>();
        
        for(Flight_passenger__c FP:NewFlight){    
            FlightMap.put(FP.Passenger__c,FP);     
        }
        
        
// If passanger will book the same flight with different section whose date of departure is same, than the error will popup.
        
        List<Passenger__c> pslist=[select id,(select id,Flight__c,Section__c,dateOfDeparture__c from Flight_passengers__r) from Passenger__c where id in:FlightMap.keyset()];
        for(Passenger__c ps:pslist){
            for(Flight_passenger__c fligPass:ps.Flight_passengers__r){
                if(FlightMap.get(ps.id).id==fligPass.id && fligPass.Flight__c==FlightMap.get(ps.id).Flight__c &&
                   fligPass.dateOfDeparture__c==FlightMap.get(ps.id).dateOfDeparture__c){
                       
                       FlightMap.get(ps.id).addError('You have already booked the section in this flight! Now you can not change the section of this flight whose depature date is same'); 
                 }
            }
        }
    }    
}