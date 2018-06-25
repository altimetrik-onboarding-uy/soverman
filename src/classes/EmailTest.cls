@isTest
public class EmailTest {
	 static testmethod void test()
     {
         Test.startTest();
         Emails.sendMail('soverman@altimetrik.com', 'TestEmailManager', '');
         Test.stopTest();
     }
}