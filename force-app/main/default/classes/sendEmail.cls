public class sendEmail {
    public static void sendEmailtoAdmin(){
        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        
        mail.setToAddresses(new String[]{'mdabdulmalik079@gmail.com'});
        
        mail.setSubject('This is a test email');
        
        mail.setPlainTextBody('Kya Khana hai aaj' + '\n' + 'Mandi, Sabba, Shawarma ya warp');
        
        emails.add(mail);
            
            Messaging.sendEmail(emails);
    }
}