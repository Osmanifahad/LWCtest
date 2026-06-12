public with sharing class shareEmployee {
@AuraEnabled(cacheable=true)	
    public static List<Employee__c> getAllEmployees(){
        List<Employee__c> emps= [SELECT Name FROM Employee__c];
        System.debug(emps);
        return emps;
    }
}