public class shareAsset {
@AuraEnabled(cacheable=true)	
    public static List<TalentAsset__c> getAssetDetails(){
        List<TalentAsset__c> asst= [SELECT Name,AssetStatus__c,AssetType__c FROM TalentAsset__c];
        System.debug(asst);
        return asst;
    }
}