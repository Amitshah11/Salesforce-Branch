({
    SaveContact : function(component, event, helper) {
        var action=component.get("c.addContact");
        var pass=component.get("v.InsertCon.Password__c");
        var confirmpass=component.get("v.SavePass");
        
        if(confirmpass==pass){
            action.setParams({                
                con:component.get("v.InsertCon")
            });
        }
        action.setCallback("this",function(response){
            var state =  response.getState();
            if(state === "SUCCESS")
            {
var toastEvent = $A.get("e.force:showToast");
    toastEvent.setParams({
        mode: 'sticky',
        message: 'This is a required message',
        messageTemplate: 'Record {0} created! See it {1}!',
        messageTemplateData: ['Salesforce', {
            label: 'here',
            }
        ]
    });
    toastEvent.fire();            }
            else if (state==="ERROR") {
                
                alert('Error');
            }            
        });
        $A.enqueueAction(action);       
    }
})