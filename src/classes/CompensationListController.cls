public with sharing class CompensationListController {
    
    private static final string BASEQUERY=  'SELECT ID, Name,  Employee_Name__r.Name,  Employee_Name__r.Birthdate__c,Job_Category__c ,RecordType.DeveloperName,'+
        ' Amount__c, Location__c, Office__c, Submitted__c, Status__c FROM Compensation__c :whereClause';
    
    @AuraEnabled
    public static List<Compensation__c> getCompensations( String recordType, boolean sub) {
        List<Compensation__c> compens = new List<Compensation__c>();
        String query= BASEQUERY;
        String searchClause = '';
        
         if (recordType == 'All'){
                 searchClause = ' ';
               String    target= ':whereClause'; 
    
              query= query.replace(target, searchClause);
            }
        if((recordType != null) || (sub!= null)){
            searchClause += 'WHERE ';
            if(recordType!= null) {
                searchClause += 'RecordType.DeveloperName=\''+ recordType +'\' ';
                if (sub!= null){
                    searchClause += ' and ';
                    
                }}
            if (sub != null){
                 searchClause += ' Submitted__c= '+sub;
            }
           String    target= ':whereClause'; 
    
           query= query.replace(target, searchClause);
            compens = Database.query(query);
        }
          
        
        
        return compens; }
    

    
    
@AuraEnabled
public static void saveCompensation(Compensation__c compensation) {
    upsert compensation;
}
    
 @AuraEnabled
  public static void updateStatus(String selectFilters)
  {
      Compensation__c comps = (Compensation__c)System.JSON.deserializeStrict(selectFilters, Compensation__c.Class);
      comps.Submitted__c = true;
      comps.Status__c = 'APPROVED';
      upsert  comps;
      saveCompensation(comps);
  }
    
}