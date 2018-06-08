({
    editRecord:function(component){
        var editRecordEvent = $A.get("e.force:editRecord");
        var x = component.get("v.compensation.Id"); 
        editRecordEvent.setParams({
            "recordId": x
        });
        editRecordEvent.fire();
        
        
    },
    
    
})