public with sharing class checkEmployee {
@AuraEnabled(cacheable=true)
    public static boolean
        getEmployee(String EmployeeName){
        List<Employee__c> emp = [SELECT Name FROM Employee__c WHERE Name=:EmployeeName];
            if(emp.isEmpty()){
                System.debug('Employee Not Found');
                return false;
            }
            else{
                System.debug('Employee Found');
                    return true;
            }
        }
}