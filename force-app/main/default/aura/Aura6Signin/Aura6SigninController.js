({
	Signin : function(component, event, helper) {
		        var action=component.get("c.findcontact");
        action.setParams({
            username:component.get("v.Username"),
            password:component.get("v.Password")
        });
        action.setCallback("this",function(response){

var count=response.getReturnValue();
            if(count==1){
                alert("User is registered")
            } 
            else if(count==0){
                                alert("User is not registered")

            }

        });
                $A.enqueueAction(action);

    }
})