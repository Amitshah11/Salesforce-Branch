({
    
    doSave : function(component, event, helper) {
        var action = component.get('c.createAccount');
        action.setParams({
            ac : component.get('v.createAcc')
        });
        action.setCallback(this,function(result){
              var state =  result.getState();
                if(state === "SUCCESS")
                {
                alert('Account created successfully');  
                 component.set('v.Id',result.getReturnValue());
                }
            else if (state=="ERROR") {
                    
                    alert('Error');
                }
      
        });
        $A.enqueueAction(action);
    },
    
     Clear : function(component, event, helper) {
component.set('v.createAcc','');        
        
    }
    
})