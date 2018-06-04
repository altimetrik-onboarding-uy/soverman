trigger avoidDeleteorUpdate on Compensation__c (before delete, before update) {


    // Prevent the deletion of accounts if the status is submitted.
    for (Compensation__c a : [SELECT Id FROM Compensation__c
                              WHERE Status__c= 'Submitted'  AND
                              Id IN :Trigger.old]) {
                                  Trigger.oldMap.get(a.Id).addError(
                                      'Cannot delete or Edit Compensations with Submitted Status.');
                              }    
}