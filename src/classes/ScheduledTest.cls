@isTest
private class ScheduledTest {


	public static String TEST_SCH = '0 0 0 25 4 ? 2022';

    static testmethod void testScheduledJob() {
		Contact contact = new Contact(lastname='Overman', firstName= 'Testing');
		insert contact;
		Compensation__c[] comps = new List<Compensation__c>();
		// insert 200 compensations to arleccino
		Date created_date = Date.today().addDays(-5);
		for (Integer i = 0; i < 5; i++) {
			comps.add(new Compensation__c(name='Testing comp ' + i,
				Job_Category__c='Senior', Location__c = 'India',
				Submitted__c = false, 
				Employee_Name__c = contact.Id));
		}
		insert comps;

        Test.startTest();
        // Schedule the test job
        String schtestwk = System.schedule('ScheduledApexTest',
            TEST_SCH,
            new ScheduleCompensationsSubmit());
        // Verify the scheduled job has not run yet. All compensations are not submitted
        Integer con = [SELECT COUNT()
		              FROM Compensation__c
					  WHERE Employee_Name__r.Name = 'Testing Overman' AND
					        Submitted__c = false];
        System.assertEquals(5, con);
        // Stopping the test will run the job synchronously
        Test.stopTest();

		CronTrigger job = [SELECT State FROM CronTrigger WHERE Id = :schtestwk];

        System.assert((job.State=='COMPLETED')||(job.State=='WAITING'));
    }
}