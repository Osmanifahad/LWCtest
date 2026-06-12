public class SOQL {
    public static void data(){
        List<Contact> contacts = [SELECT LastName FROM Contact];
        System.debug(contacts);
    }
    public static void addContact(){
      
        Account a = new Account();
        a.Name = 'Facebook';
        a.AnnualRevenue = 100000;
        insert a;

		Account b = new Account();
        b.Name = 'LinkedIn';
        b.AnnualRevenue = 200000;
        insert b;

		Account c = new Account();
        c.Name = 'Monster';
        c.AnnualRevenue = 300000;
        insert c;

		Account d = new Account();
        d.Name = 'Foundit';
        d.AnnualRevenue = 400000;
        insert d;

		Account e = new Account();
        e.Name = 'Apple';
        e.AnnualRevenue = 600000;
        insert e;
                System.debug(c);
    }
    public static void updateContact(){
        Account a1 = [SELECT Name,AnnualRevenue from Account where Name='Apple' Limit 1];
        a1.AnnualRevenue= 7000000;
        update (a1);
System.debug(a1);
    }

    public static void getData(){
        List<Account> account= [SELECT Name,AnnualRevenue From Account where AnnualRevenue > 250000];
        for(account a:account){
            System.debug (a);
        }
        
    }
}