public class CompensationListControllerTest {
    public static List<Compensation__c> createCompensationWithContacts(Integer nuComps, Integer nuContacts) {
        List<Contact> contac = new List<Contact>();
        
        
        for(Integer i=0;i<nuComps;i++) {
            Contact a = new Contact(LastName='TestLast' + i);
            contac.add(a);
        }
        insert contac;
        
        List<Compensation__c> comps = new List<Compensation__c>();
        for (Integer j=0;j<nuComps;j++) {
            Contact cont = contac[j];
            // For each contact just inserted, add compensation
            for (Integer k=0;k<nuContacts;k++) {
                comps.add(new Compensation__c( name='first'+k, Employee_Name__c=cont.Id,
                                              Status__c='Submitted',
                                              Job_Category__c='Junior',
                                              Location__c='US'
                                             ));
            }
        }
        // Insert all compensations for all contacts.
        insert comps;
        
        return comps;
    }
}