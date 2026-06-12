public class AssetManagement {
    public static void newEmployee(){
        Employee__c e = new Employee__c();
        e.Name = 'John Carter';
        insert e;
        
        Employee__c e2 = new Employee__c();
        e2.Name = 'John Cena';
        insert e2;
        
        Employee__c e3 = new Employee__c();
        e3.Name = 'Anthony Gomez ';
        insert e3;
        System.debug(e3);
            
    }

    public static void newAsset(){
        TalentAsset__c a = New TalentAsset__c();
        a.Name = 'HP Pavilion';
        a.AssetStatus__c = 'New';
        a.AssetType__c = 'laptop';
        insert a;  
        
            TalentAsset__c b = New TalentAsset__c();
            b.Name ='Asus Razor';
            b.AssetStatus__c ='New';
            b.AssetType__c ='laptop';
            insert b;
            
                TalentAsset__c c = New TalentAsset__c();
                c.Name ='JBL Bassbooster';
                c.AssetStatus__c ='New';
                c.AssetType__c ='Headphone';
                insert c;

                    TalentAsset__c d = New TalentAsset__c();
                    d.Name ='Dell mouse';
                    d.AssetStatus__c ='New';
                    d.AssetType__c ='Mouse';
                    insert d;
    }
 
    public static void addNewEmployee( string name ){
         Employee__c a = new Employee__c();
        a.Name = name;
        insert a;
        
    }
    
    public static void addNewAsset(String name, String Status, String AssetType){
         TalentAsset__c a = new TalentAsset__c();
        a.Name = name;
        a.AssetStatus__c = Status;
        a.AssetType__c = AssetType;
        insert a;
        
    }
    
    public static void getAllEmployees(){
        List<Employee__c> emps = [SELECT id,Name From Employee__c];
        for(Employee__c e:emps){
            System.debug(e);
        }
    }
    
		public static void getAllAssets(){
        List<TalentAsset__c> asst = [SELECT id,Name From TalentAsset__c];
        for(TalentAsset__c a:asst){
            System.debug(a);
        }
		}
    public static void assignAsset(Id assetId,Id employeeId){
        List<TalentAsset__c> a = [SELECT Id, Name, isAssigned__c, Employee__c, AssetStatus__c from TalentAsset__c where Id=:assetId];
        if(a.isEmpty()){
            System.debug('Asset Not Found');
            return;
        }
        else{
            System.debug ('Asset Exist');
        }
        
        if(a[0].isAssigned__c == True){
		System.debug('Asset Is Assigned');
            return;
        }
        
        else{
            System.debug('Asset Not Assigned');
        }
    
        List<Employee__c> b = [SELECT Id, Name from Employee__c where Id=:employeeId];
        if(b.isEmpty()){
            System.debug('Epm Not Found');
            return;
        }
        else{
            System.debug ('Emp Exist');
        }
        
        if(a[0].AssetStatus__c == 'Broken'|| a[0].AssetStatus__c == 'Service'){
            System.debug('Asset not assignable');
            return;
        }

		a[0].Employee__c = employeeId;
            a[0].isAssigned__c = true;
            update a[0];
        System.debug('The Asset' + a[0].Name +'is Assigned to'+ b[0].Name);
        }
        
    public static void unAssignAsset(Id assetId){
  List<TalentAsset__c> a = [SELECT Id, Name, isAssigned__c, Employee__c, AssetStatus__c from TalentAsset__c where Id=:assetId];
        if(a.isEmpty()){
            System.debug('Asset Not Found');
            return;
        }
        else{
            System.debug ('Asset Exist');
        }
            if(a[0].isAssigned__c == False){
		System.debug('Asset Is Not Assigned');
            return;
        }
        
        else{
            System.debug('Asset is Assigned');
        }
        a[0].Employee__c = Null;
            a[0].isAssigned__c = False;
            update a[0];
        System.debug('The Asset is unAssigned');
       
    } 
    
    public static void changeStatus(id assetId, String AssetStatus){      
    	List<TalentAsset__c> s = [SELECT Id, Name, isAssigned__c, Employee__c, AssetStatus__c from TalentAsset__c where Id=:assetId];
        if(s.isEmpty()){
            System.debug('Asset Not Found');
            return;
        }
        else{
            System.debug ('Asset Exist');
        }
        
        s[0].AssetStatus__c = AssetStatus;
        update s[0];
}
    
    
    public static void GetAvailableAssets(){
         	List<TalentAsset__c> s = [SELECT Id, Name, isAssigned__c, Employee__c, AssetStatus__c from TalentAsset__c where isAssigned__c = false and AssetStatus__c !='Broken'];
        System.debug (s);
        }
    public static void getEmployeeAssets(id empid){
        List<TalentAsset__c> ea = [SELECT Id, Name, isAssigned__c, Employee__c, AssetStatus__c from TalentAsset__c where Employee__c =:empid];
        System.debug (ea);
        }
    
    
    public static void markAssetBroken(id assetid){
                List<TalentAsset__c> ab = [SELECT Id, Name, isAssigned__c, Employee__c, AssetStatus__c from TalentAsset__c where id=:assetid];
				ab[0].AssetStatus__c = 'Broken';
        update ab[0];
    }
    
    public static void deleteAsset(id assetid){
		                List<TalentAsset__c> ab = [SELECT Id, Name, isAssigned__c, Employee__c, AssetStatus__c from TalentAsset__c where id=:assetid];
				delete ab;
}
}