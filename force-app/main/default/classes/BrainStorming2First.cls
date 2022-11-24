public class BrainStorming2First {
    
    public static void main(){
        
        List<Passenger__c> addpass= new List<Passenger__c>();
        List<String> AgGroup= new List<String>{'Adult','Child','Infants'};
            List<integer> year= new List<integer>{1994,2019,2021};
                
                integer per=1;
        For(integer i=0;i<3;i++){                         
            for(integer j=0;j<3;j++){
                Passenger__c Newps= new Passenger__c();
                Newps.Name='BrainStorming2 '+per;
                Newps.DateOfBirth__c=date.newInstance(year[j], 5, 20).addMonths(j);
                Newps.AgeGroup__c=AgGroup[j]; 
                addpass.add(Newps);
                per++;   
            }   
        }
        insert addpass;
        
        List<Flight__c> addFlight= new  List<Flight__c>();
        
        for(integer F=0;f<3;f++){
            Flight__c flight= new Flight__c(capacity__C=20);
            addFlight.add(flight); 
        }
        insert addFlight;   
        
        List<String> Sections= new List<string>{'First class', 'Business class', 'Economy class'};
            List<Flight_passenger__c> FlightList= new List<Flight_passenger__c>();       
        
        integer increment=0;

        For(integer k=0;k<3;k++){             
            for(integer fp=0;fp<3;fp++){
                Flight_passenger__c NewFlightP= new Flight_passenger__c();
                
                NewFlightP.Flight__c=addFlight[k].id;
                NewFlightP.Passenger__c=addpass[increment].id;              
                NewFlightP.DateOfDeparture__c=date.today()+1;
                NewFlightP.Section__c=Sections[fp];
                FlightList.add(NewFlightP);  
                increment++;
            }  
        } 
        insert FlightList;   
    }   
}