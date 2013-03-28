package tools;

	import java.security.Security;  
	import java.util.Properties;  
	  
	import javax.mail.Message;  
	import javax.mail.MessagingException;  
	import javax.mail.PasswordAuthentication;  
	import javax.mail.Session;  
	import javax.mail.Transport;  
	import javax.mail.internet.InternetAddress;  
	import javax.mail.internet.MimeMessage;  
	  
	public class GmailSender {
	  
	    private static final String SMTP_HOST_NAME = "smtp.gmail.com";  
	    private static final String SMTP_PORT = "465";  
	    private static final String emailMsgTxt = "這是一封重要的信 測試我能不能寄信4=B8=80=E5=B0=81=";     //信件內容
	    private static final String emailSubjectTxt = "這是一封重要的信4=B8=80=E5=B0=81=4=B8=80=E5=B0=81=";   //標題
	    private static final String emailFromAddress = "davidou123@hotmail.com";  				//寄信者
	    private static final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";  
	    private static final String[] sendTo = { "davidou1234@gmail.com" };  					//收信者
	  
	
	  
	    public void sendSSLMessage(String recipients[], String subject, String message, String from)  
	            throws MessagingException {  
	        boolean debug = true;  
	  
	        Properties props = new Properties();  
	        props.put("mail.smtp.host", SMTP_HOST_NAME);  
	        props.put("mail.smtp.auth", "true");  
	        props.put("mail.debug", "true");  
	        props.put("mail.smtp.port", SMTP_PORT);  
	        props.put("mail.smtp.socketFactory.port", SMTP_PORT);  
	        props.put("mail.smtp.socketFactory.class", SSL_FACTORY);  
	        props.put("mail.smtp.socketFactory.fallback", "false");  
	  
	        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {  
	  
	            protected PasswordAuthentication getPasswordAuthentication() {  //帳號密碼
	                return new PasswordAuthentication("davidou1234", "");  
	            }  
	        });  
	  
	        session.setDebug(debug);  
	  
	        Message msg = new MimeMessage(session);  
	        InternetAddress addressFrom = new InternetAddress(from);  
	        msg.setFrom(addressFrom);  
	  
	        InternetAddress[] addressTo = new InternetAddress[recipients.length];  
	        for (int i = 0; i < recipients.length; i++) {  
	            addressTo[i] = new InternetAddress(recipients[i]);  
	        }  
	        msg.setRecipients(Message.RecipientType.TO, addressTo);  
	  
	        // Setting the Subject and Content Type  
	        msg.setSubject(subject);  
	        msg.setContent(message, "text/html; charset=utf-8");  
	        Transport.send(msg);  
	    }  
	    
	    
	    public static void main(String args[]) throws Exception {
	  	  
//	        Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());  
	        
//	        String[] sendTomail = { "davidou1234@gmail.com" }; 
//	        new GmailSender().sendSSLMessage(sendTomail, "酒迷官方網站測試標題", "酒迷官方網站測試標題 這是一封重要的信", "davidou123@hotmail.com");  
//	        new GmailSender().sendSSLMessage(sendTo, emailSubjectTxt, emailMsgTxt, emailFromAddress);  
//	        System.out.println("Sucessfully Sent mail to All Users");  
	   
	    } 
	    
	    
	}  