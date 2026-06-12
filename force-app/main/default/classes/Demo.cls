public class Demo {
    public static void sayhello(){
        System.debug('say hello');
    }
    public static void addNumbers(){
        Integer a = 1;
        Integer b = 2;
        System.debug(a+b);
    }
    public static void subNumbers(){
        Integer a = 5;
        Integer b = 10;
        System.debug(a-b);
    }
    public static void dateTime(){
    Integer a = 1;
    Decimal b = 2.2;
    String c = 'Word';
    Boolean d = true;
    Boolean e = False;
    Date t = Date.today();
    Datetime n = System.now();
    System.debug(n);
}
    public static void contact(){
        Contact x = new Contact();
        x.FirstName = 'Fahad';
        x.LastName = 'Osmani';
        x.Phone = '7799063286';
        x.Email = 'fahadosm47@gmail.com';
        insert x;
    }
}