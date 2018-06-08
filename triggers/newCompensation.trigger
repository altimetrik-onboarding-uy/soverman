trigger newCompensation on Compensation__c (before insert) {
    for(Compensation__c a : Trigger.New) {
        a.Status__c = 'Submitted';
    }   
}