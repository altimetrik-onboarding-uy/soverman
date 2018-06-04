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
    
    
    
    @isTest public static void CompensationListTest() {
        
        Contact cont= new Contact(FirstName='Test2', LastName='Testing2');
        insert cont;
        
        String contName = cont.Name;
        
        Compensation__c f = new Compensation__c();
        
        f.Amount__c =3000;
        f.Job_Category__c= 'Junior';
        f.Employee_Name__c= cont.Id;
        f.Name= 'quinta';
        f.Status__c= 'submitted';
        f.Location__c ='US';
        f.Amount__c= 3000;
        f.Office__c= 'Michigan';
        f.Submitted__c= True;
        f.RecordTypeId= '012f4000000yXjMAAU';
        
        
        
        insert f;
        
        
        
        List<Compensation__c>  getCompensations = CompensationListController.getCompensations(null);
        List<Compensation__c>  getCompensation = CompensationListController.getCompensations('Salary');
        CompensationListController.saveCompensation(f) ;
        
    }         
    
    @isTest static void CompensationListControllerTest() {
        
        List<Compensation__c> h= CompensationListControllerTest.createCompensationWithContacts(1, 1);
        
        
        
    }
    
    
    
}