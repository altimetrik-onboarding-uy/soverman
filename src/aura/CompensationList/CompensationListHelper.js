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
    getAll: function(component) {
        console.log('Executing helper for getSalary');  
        var action = component.get('c.getCompensations');
        action.setParam('recordType', 'All');
        // Set up the callback
        var self = this;
        action.setCallback(this, function(actionResult) {
            console.log(JSON.parse(JSON.stringify(actionResult.getReturnValue())));
            component.set('v.compensations', actionResult.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    
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
    getSubmitted: function(component) {
        console.log('Executing helper for getsubmitted');  
        var action = component.get('c.getCompensations');
        action.setParam('sub', true);
        // Set up the callback
        var self = this;
        action.setCallback(this, function(actionResult) {
            console.log(JSON.parse(JSON.stringify(actionResult.getReturnValue())));
            component.set('v.compensations', actionResult.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    getNotSubmitted: function(component) {
        console.log('Executing helper for getNotsubmitted');  
        var action = component.get('c.getCompensations');
        action.setParam('sub', false);
        // Set up the callback
        var self = this;
        action.setCallback(this, function(actionResult) {
            console.log(JSON.parse(JSON.stringify(actionResult.getReturnValue())));
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
    },
    convertArrayOfObjectsToCSV : function(mylist) {
        
        var myCsvList = 'Employee Name, Birthdate, Job Category, Compensation Type, Amount, Location, Office, Submitted,Status\r\n';
        var i;
        for(i = 0; i < mylist.length; i++){
            myCsvList += mylist[i].Employee_Name__r.Name + ',';
            myCsvList += mylist[i].Employee_Name__r.Birthdate__c + ',';
            myCsvList += mylist[i].Job_Category__c + ',';
            myCsvList += mylist[i].RecordType.DeveloperName + ',';
            myCsvList += mylist[i].Amount__c + ',';
            myCsvList += mylist[i].Location__c + ',';
            myCsvList += mylist[i].Office__c + ',';
            myCsvList += mylist[i].Submitted__c + ',';
            myCsvList += mylist[i].Status__c + '\r\n';
        }
        
        
        // check if "myCsvList"  is null, then return from function
        if (myCsvList == null || !myCsvList.length) {console.log('ohh noo, ta\' vacio')
        return null;
                                                    }
        
        
        var hiddenElement = document.createElement('a');
        hiddenElement.href = 'data:text/csv;charset=utf-8,' + encodeURI(myCsvList);
        hiddenElement.target = '_self'; // 
        hiddenElement.download = 'compensationList.csv';  
        document.body.appendChild(hiddenElement); 
        hiddenElement.click(); 
        
        
    } ,
    
    
    
    
    
})