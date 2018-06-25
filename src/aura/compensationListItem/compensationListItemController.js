({
    doInit : function(component, event, helper) {
 		var comp = component.get("v.compensation");

 	},
    doEdit: function(component, event, helper) {
        console.log('Executing controller for edition');  
        helper.editRecord(component);

        
    },
    
checkboxChanged : function(component, event, helper){
		helper.statusNowTrue(component);
	}
})