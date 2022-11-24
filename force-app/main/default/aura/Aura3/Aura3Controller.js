({
    
    
    doSave : function(component, event, helper) {
        var action1 = component.get('c.updateClosedate');
        action1.setParams({
            Opid : component.get('v.recordId'),
            clos: component.get('v.OppDate')
        });
        action1.setCallback(this,function(result){
            
            var state =  result.getState();
            if(state ==='SUCCESS')
                
            {
                $A.get("e.force:refreshView").fire();
                
            }
            else if (state=="ERROR") {
                
                alert('Error');
            }
            
        });
        $A.enqueueAction(action1);
    }
})