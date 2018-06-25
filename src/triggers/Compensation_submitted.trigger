trigger Compensation_submitted on Compensation__c ( before update) {
 
     for (Compensation__c comp: Trigger.old){
     
         if(comp.Submitted__c==false){
           Compensation__c newRecord = Trigger.newMap.get(comp.Id);
			if (newRecord != null) {
			//newRecord.AddError('You cant modify or delete this Compensation because it was submitted. Ask to the Manager =P');
			}
         }
     }
 }