public class Emails {
	// Public method
    public static void sendMail(String address, String subject, String body) {
        // Create an email message object
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {address};
        mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        Messaging.SendEmailResult[] results = null;
       try{
           results = Messaging.sendEmail(
                                 new Messaging.SingleEmailMessage[] { mail });
       } catch (System.EmailException ee){
            System.debug('Error: ' + ee.getMessage());
       }
    }
}