global class SubmitPendingCompensations implements Database.Batchable<sObject>{
    
global Database.QueryLocator start(Database.BatchableContext bc) {
    
        return Database.getQueryLocator(
            'SELECT Submitted__c FROM Compensation__c WHERE CreatedDate <= LAST_N_DAYS:2 AND Submitted__c = false'
        );
	}

      
    
     global void execute(Database.BatchableContext bc, List<Compensation__c> scope){
        List<Compensation__c> c = new List<Compensation__c>();
        for (Compensation__c compen : scope) {
            compen.Submitted__c = true;
            c.add(compen);
        }   
        update c;
    }    

	global void finish(Database.BatchableContext BC) {
		String body = 'Saved ' + DateTime.now();
		Emails.sendMail('soverman@altimetrik.com', 'Submissions made', body);
	}
}