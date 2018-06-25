({
    editRecord:function(component){
        var editRecordEvent = $A.get("e.force:editRecord");
        var x = component.get("v.compensation.Id"); 
        editRecordEvent.setParams({
            "recordId": x
        });
        editRecordEvent.fire();
        
        
    },
    
    statusNowTrue : function(component){
			var action = component.get('c.updateStatus');
			action.setParams({ selectFilters : JSON.stringify(component.get('v.compensation'))});
			console.log(JSON.stringify(component.get('v.compensation')));

			// Set up the callback
			var self = this;
			action.setCallback(this, function(response) {
			var state = response.getState();
		if (state === "SUCCESS") {
				
					//component.set('v.components', response.getReturnValue());
					console.log("We got it");
					
			}
			else if (state === "INCOMPLETE") {
			}
			else if (state === "ERROR") {
					var errors = response.getError();
					if (errors) {
							if (errors[0] && errors[0].message) {
									console.log("Error message: " + 
													errors[0].message);
							}
					} else {
							console.log("Dont know what happened");
					}
			}
			});

        $A.enqueueAction(action);}
			
    
    
})