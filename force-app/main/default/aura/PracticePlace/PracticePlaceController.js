({
	Acclist : function(component, event, helper) {
            var action = component.get("c.createListOfAcc");
            
            action.setCallback(this,function(response){

                component.set('v.AcList',response.getReturnValue());


            });
            $A.enqueueAction(action);
        },
    Conlist : function(component, event, helper) {
            var action1 = component.get("c.createListOfCon");
            
            action1.setCallback(this,function(response){

                component.set('v.CoList',response.getReturnValue());


            });
            $A.enqueueAction(action1);
        }
})