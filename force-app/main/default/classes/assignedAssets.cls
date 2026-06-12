public class assignedAssets {
    @AuraEnabled(cacheable=true)
    public static List<TalentAsset__c> getEmployeeAsset(String empName){
        System.debug ('employee id received:'+ empName);
        List <Employee__c> employee = [SELECT Name,Id from Employee__c where Name =: empName];
        List<TalentAsset__c> empAsset = [SELECT Name,AssetStatus__c,AssetType__c FROM TalentAsset__c WHERE Employee__c=:employee[0].Id];
        if(empAsset.isEmpty()){
            System.debug ('Asset Not Assigned');
                return empAsset;
        }
        else{
            System.debug('Employee Asset' + empAsset);
            return empAsset;
        }
    }

}