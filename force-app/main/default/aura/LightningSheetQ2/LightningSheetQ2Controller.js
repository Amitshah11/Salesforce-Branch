({
        Conlist : function(component, event, helper) {
            var action1 = component.get("c.createListOfAcc");
            
            action1.setCallback(this,function(response){
                var values=[];
                var result=response.getReturnValue();
                for(var key in result){
                    values.push({
                        label:result[key],
                        value:key});
                }
                                component.set("v.AcList",values);

            });
            $A.enqueueAction(action1);
        },
    
     doSave : function(component, event, helper) {
        var action = component.get('c.Insertcontact');
        action.setParams({
            "con" : component.get('v.createcon')
        });
        action.setCallback(this,function(result){
           var state =  result.getState();
                if(state === "SUCCESS")
                {
                alert('Contact created successfully');     
            component.set('v.Id',result.getReturnValue());
                }
            else if (state=="ERROR") {
                    
                    alert('Error');
                }
        });
        $A.enqueueAction(action);
    },
      Clear : function(component, event, helper) {
component.set('v.createcon','');
          
        
    }
    
})