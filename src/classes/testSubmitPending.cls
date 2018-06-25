@isTest
private class testSubmitPending {

	@testSetup
    static void setup() {
Contact contact = new Contact(lastname='Montilla', FirstName='Test');
		insert contact;
		Compensation__c[] comps = new List<Compensation__c>();
		Date created_date = Date.today().addDays(-5);
        for (Integer i = 0; i < 200; i++) {
            comps.add(new Compensation__c(name='Testing this no. ' + i,
                Job_Category__c='Senior', Location__c = 'India',
				Submitted__c = false, 
				Employee_Name__c = contact.Id));
        }
        insert comps;
    }

	@isTest static void test_method_one() {
		Test.startTest();
        SubmitPendingCompensations test1 = new SubmitPendingCompensations();
        Id batchId = Database.executeBatch(test1);
        Test.stopTest();

        System.assertEquals(200, [SELECT COUNT() FROM Compensation__c
								  WHERE Employee_Name__r.Name = 'Test montilla' AND Submitted__c = true]);
	}
}