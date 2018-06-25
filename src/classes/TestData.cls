@isTest 

private class TestData {
    
    
    @isTest static void NewCompensationsTest() {
        
        Compensation__c[] comps = CompensationListControllerTest.createCompensationWithContacts(1, 1);
        
        // Perform test
        Test.startTest();
        Database.DeleteResult result = Database.delete(comps[0], false);
        Test.stopTest();
        
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('Cannot delete or Edit Compensations with Submitted Status.',
                            result.getErrors()[0].getMessage());
        
        
    }
        
    @isTest static void Compensation_submittedTest() {
        
        Compensation__c[] comps = CompensationListControllerTest.createCompensationWithContacts(1, 1);
        
        // Perform test
        Test.startTest();
        Database.SaveResult results = Database.update(comps[0], false);
        Test.stopTest();
        
        System.assert(!results.isSuccess());
        System.assert(results.getErrors().size() > 0);
        System.assertEquals('You cant modify or delete this Compensation because it was submitted. Ask to the Manager =P',
                            results.getErrors()[0].getMessage());
        
        
    }
    
    
    
    
    @isTest public static void CompensationListTest() {
        
       
        
        Compensation__c[] all_comp_not_submitted = [SELECT Id, Name, RecordType.DeveloperName
									FROM Compensation__c
									WHERE Submitted__c = false];
		Integer all_comp_not_submitted_count = all_comp_not_submitted.size();

		Test.startTest();

		Compensation__c[] all_comp_not_sub_ctrl = CompensationListController.getCompensations('All', false);
		Test.stopTest();
        
        
    }         
     @isTest public static void CompensationListTest2() {
        
       
        
        Compensation__c[] all_comp_not_submitted = [SELECT Id, Name, RecordType.DeveloperName
									FROM Compensation__c
									WHERE Submitted__c = false];
		Integer all_comp_not_submitted_count = all_comp_not_submitted.size();

		// get all compensations using static class method with the filter=not_submitted
		// 
		  try
        {
		Test.startTest();
		Compensation__c[] all_comp_not_sub_ctrl2 = CompensationListController.getCompensations('All', false);
		Test.stopTest();
        }
        
        catch(Exception e)
        {
             System.debug(e.getMessage());
        }
     }
    
      @isTest public static void CompensationListTest3() {
        
       
        
       
        List<Compensation__c> getCompensations = new List<Compensation__c>();
        List<Compensation__c> getCompensation = new List<Compensation__c>();
        Contact cont= new Contact(FirstName='Test2', LastName='Testing2');
        insert cont;
        
        String contName = cont.Name;
        Compensation__c d = new Compensation__c( Job_Category__c= 'Junior',
        Employee_Name__c= cont.Id,
        Name= 'Testing again',
        Status__c= 'SUBMITTED',
        Location__c ='US',
        Amount__c= 300,
        Office__c= 'Michigan',
        Submitted__c= false,
        RecordTypeId= '012f4000000yXjMAAU');
        insert d;

        try
        {
            Test.startTest();
            
         getCompensations = CompensationListController.getCompensations(null, true);
         getCompensation = CompensationListController.getCompensations('research', false);
CompensationListController.updateStatus(JSON.serialize(d));

            Test.stopTest();
    
    CompensationListController.saveCompensation(d) ;

            Test.stopTest();
        }
        catch(Exception e)
        {
             System.debug(e.getMessage());
        }

        System.assert(getCompensations.size() >=  getCompensation.size());

        
    }         
         
        
           
    
    
    @isTest static void CompensationListControllerTest() {
        
        List<Compensation__c> h= CompensationListControllerTest.createCompensationWithContacts(1, 1);
        
        
        
    }
    
    
    
}