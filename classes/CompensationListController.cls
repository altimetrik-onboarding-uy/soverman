public with sharing class CompensationListController {
    
    private static final string BASEQUERY=  'SELECT ID, Name,  Employee_Name__r.Name,  Employee_Name__r.Birthdate__c,Job_Category__c ,RecordType.DeveloperName,'+
       ' Amount__c, Location__c, Office__c, Submitted__c, Status__c FROM Compensation__c :whereClause ORDER BY RecordType.DeveloperName ASC';
        
  @AuraEnabled
  public static List<Compensation__c> getCompensations( String recordType) {
      String query = BASEQUERY;
      if(recordType==null){
          String target= ':whereClause' ;
          String replace = '';  
          query= query.replace(target, replace);
      }  else {
           String target= ':whereClause' ;
          String replace = 'WHERE RecordType.DeveloperName=\''+recordType+'\'';  
          query= query.replace(target, replace);
      }
    return (List<Compensation__c>)Database.query(query);
        
        }
   
    

    
    
@AuraEnabled
public static void saveCompensation(Compensation__c compensation) {
    // Perform isUpdateable() check here 
    upsert compensation;
}
    
}