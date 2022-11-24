({
	objlist : function(component, event, helper) {
		var action = component.get("c.ObjectApiNames");
            
            action.setCallback(this,function(response){

                component.set('v.ApiList',response.getReturnValue());

            });
            $A.enqueueAction(action);
        
	},
    
    NamesList:function(component, event, helper) {
     
        var action1 = component.get("c.AllNameList");
         action1.setParams({

             ObjName:component.get('v.ApiN')

            });
            
            action1.setCallback(this,function(response){
                
                console.log(response.getReturnValue());
                component.set('v.AllName',response.getReturnValue());

            });
            $A.enqueueAction(action1);
        
    }
})