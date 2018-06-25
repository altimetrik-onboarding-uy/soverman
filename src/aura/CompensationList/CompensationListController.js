({   
      
    doInit : function(component, event, helper) {
        helper.getCompensation(component);//get data from the helper
      		var comp = component.get("v.compensation");
    },
   
     all: function(component, event, helper) {
        console.log('all');
        helper.getAll(component);//get data from the helper
          console.log('get all done');
    },
    salary : function(component, event, helper) {
        console.log('salary');
        helper.getSalary(component);//get data from the helper
          console.log('salary done');
    },
    
    study : function(component, event, helper) {
        helper.getStudy(component);//get data from the helper
    },
    research : function(component, event, helper) {
        helper.getResearch(component);//get data from the helper
    },
    
    submitted : function(component, event, helper) {
        helper.getSubmitted(component);//get data from the helper
    },
     notSubmitted : function(component, event, helper) {
        helper.getNotSubmitted(component);//get data from the helper
    },
      
    createCompensation : function(component, event, helper) {

    var newCompensation = component.get("v.newCompensation");
    helper.createCompensation(component, newCompensation);
},
   

     downloadCsv: function(component,event,helper){
        
        var mylist = component.get('v.compensations');
        
        // call the helper function which "return" the CSV data as a String   
        helper.convertArrayOfObjectsToCSV(mylist);   
        
    }  

        
})