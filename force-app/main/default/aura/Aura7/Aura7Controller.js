({
	Details : function(component, event, helper) {
		var action=component.get('c.showAccDetails');
        action.setCallback(this,function(response){
            component.set("v.AccDetails",response.getReturnValue());
        });
        $A.enqueueAction(action);
	}
})