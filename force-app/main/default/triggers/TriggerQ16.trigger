trigger TriggerQ16 on OpportunityLineItem (before insert) {
  
    List<String> priceb=new List<String>{'ASIA','EMA','SA','NA'};
    
    for(OpportunityLineItem oli:trigger.new){

        if(!priceb.contains(oli.PricebookEntry.pricebook2.name)){
            oli.adderror('use only "ASIA, EMA, SA, NA"');
        }
    }
}