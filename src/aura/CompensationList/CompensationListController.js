({   
      
    doInit : function(component, event, helper) {
        helper.getCompensation(component);//get data from the helper
    },
    salary : function(component, event, helper) {
        console.log('salary');
        helper.getSalary(component);//get data from the helper
          console.log('salary helper ejecutado');
    },
    study : function(component, event, helper) {
        helper.getStudy(component);//get data from the helper
    },
    research : function(component, event, helper) {
        helper.getResearch(component);//get data from the helper
    },
   
    
    createCompensation : function(component, event, helper) {

    var newCompensation = component.get("v.newCompensation");
    helper.createCompensation(component, newCompensation);
}
        
})