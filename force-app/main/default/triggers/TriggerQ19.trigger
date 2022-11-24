trigger TriggerQ19 on Lead (before insert) {

    Integer count=0;
    List<Lead> leadlist= [select id,owner.Name from lead where CreatedDate=THIS_MONTH];
    For(lead led:leadlist){
        
        if(led.owner.name==userinfo.getName()){
        count++;
        } }
    for(Lead led1:trigger.new){
        If(count>=20){
            led1.adderror('Limit exceeded');
        }
    }  
}