package in.gov.rera.notification.service;

import javax.mail.Message;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import in.gov.rera.notification.model.EmailNotification;
import in.gov.rera.notification.model.MailConstants;

public class EmailSender extends Thread {

	private EmailNotification email;
	
 public	EmailSender(EmailNotification email){
	 this.email=email;
 }
	
	public void run(){
		try{
			sendEmail();
			System.out.println("Mail send:::::::::::::");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void sendEmail()throws Exception{
		
		 MimeMessage message = new MimeMessage(MailConstants.getAuthSession());
        
         message.setFrom(new InternetAddress(MailConstants.EMAIL_MAILFROM));

         message.addRecipient(Message.RecipientType.TO, new InternetAddress(this.email.getSendTo()));
      
         message.setSubject(this.email.getSubject());
         
         if(email.isHtmlMsg()){
         message.setContent(email.getBodyContent(), "text/html");
         }else{
        	   message.setContent(email.getBodyContent(), "text/plain");
         }

         //message.setText(msg);
         Transport.send(message);
	}
	
	public static void main(String[] args) {
		EmailNotification email=new EmailNotification();
		email.setSubject("Test mail  ");
		email.setBodyContent("Test mail");
		email.setSendTo("parvesh.singh09@gmail.com");
		EmailSender s=new EmailSender(email);
		s.start();
		System.out.println("Finish");
	}
}
