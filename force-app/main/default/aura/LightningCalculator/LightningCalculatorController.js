({
	 
    resultadd : function(component, event, helper) {
 
     var first=component.get('v.input1');
        var second=component.get('v.input2');
        var res=parseInt(first)+parseInt(second);
        component.set('v.result',res);
          
},
     resultsub : function(component, event, helper) {
 
     var first=component.get('v.input1');
        var second=component.get('v.input2');
        var res=parseInt(first)-parseInt(second);
        component.set('v.result',res);
          
},
     resultmul : function(component, event, helper) {
 
     var first=component.get('v.input1');
        var second=component.get('v.input2');
        var res=parseInt(first)*parseInt(second);
        component.set('v.result',res);
          
},
     resultdiv : function(component, event, helper) {
 
     var first=component.get('v.input1');
        var second=component.get('v.input2');
        var res=parseInt(first)/parseInt(second);
        component.set('v.result',res.toFixed(2));
          
}
})