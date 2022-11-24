({
    AccountHandle : function(component, event, helper) {
        var action = component.get('c.AccountList'); 
        action.setCallback(this, function(response){
            component.set('v.AccList',response.getReturnValue());

        });
        $A.enqueueAction(action);
    },
    
    ChangeHandle : function(component, event, helper) {
        var action1 = component.get('c.ContactList');
                var action2 = component.get('c.OpportunityList');

        action1.setParams({
        accid : component.get('v.AcId')
        });
         action2.setParams({
        acid : component.get('v.AcId')
        });
        action1.setCallback(this, function(response){
        component.set('v.ConList',response.getReturnValue());     
        });
       
         action2.setCallback(this, function(response){
        component.set('v.OppList',response.getReturnValue());     
        });
        $A.enqueueAction(action1);
                $A.enqueueAction(action2);

    }
})