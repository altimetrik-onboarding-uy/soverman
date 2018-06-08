({
  // Fetch the accounts from the Apex controller
   getCompensation: function(component) {
    var action = component.get('c.getCompensations');
    // Set up the callback
    var self = this;
    action.setCallback(this, function(actionResult) {
     
     component.set('v.compensations', actionResult.getReturnValue());
    });
       
       
    $A.enqueueAction(action);
   },  // Fetch the accounts from the Apex controller
   getSalary: function(component) {
     console.log('Executing helper for getSalary');  
     var action = component.get('c.getCompensations');
       action.setParam('recordType', 'Salary');
    // Set up the callback
    var self = this;
    action.setCallback(this, function(actionResult) {
        console.log(JSON.parse(JSON.stringify(actionResult.getReturnValue())));
     	component.set('v.compensations', actionResult.getReturnValue());
    });
    $A.enqueueAction(action);
  },
  // Fetch the accounts from the Apex controller
   getStudy: function(component) {
    var action = component.get('c.getCompensations');
       action.setParam('recordType', 'Study');
    // Set up the callback
    var self = this;
    action.setCallback(this, function(actionResult) {
     component.set('v.compensations', actionResult.getReturnValue());
    });
    $A.enqueueAction(action);
  },
  // Fetch the accounts from the Apex controller
   getResearch: function(component) {
       var action = component.get('c.getCompensations');
       action.setParam('recordType', 'Research');
    // Set up the callback
    var self = this;
    action.setCallback(this, function(actionResult) {
     component.set('v.compensations', actionResult.getReturnValue());
    });
    $A.enqueueAction(action);
  },
  

    
    createCompensation: function(component, compensation) {
    this.upsertExpense(component, expense, function(a) {
        var compenations = component.get("v.compensations");
        compensations.push(a.getReturnValue());
        component.set("v.compensations", compensations);
    });
},
upsertCompensation : function(component, compensation, callback) {
  var action = component.get("c.saveCompensation");
  action.setParams({ 
      "compensation": compensation
  });
  if (callback) {
      action.setCallback(this, callback);
  }
  $A.enqueueAction(action);
}
       
})