package com.onlineretail.controller;

import java.util.*;  
import javax.mail.*;  
import javax.mail.internet.*;  

public class MailConfig {

 public void sendMail(String recipient,String newPassword){

	 final String username = "phoenixuis2018@gmail.com";
     final String password = "phoenix_2018";

     Properties prop = new Properties();
     prop.put("mail.smtp.host", "smtp.gmail.com");
     prop.put("mail.smtp.port", "587");
     prop.put("mail.smtp.auth", "true");
     prop.put("mail.smtp.starttls.enable", "true"); //TLS
     
     Session session = Session.getInstance(prop,
             new javax.mail.Authenticator() {
                 protected PasswordAuthentication getPasswordAuthentication() {
                     return new PasswordAuthentication(username, password);
                 }
             });

     try {

         Message message = new MimeMessage(session);
         message.setFrom(new InternetAddress(username));
         message.setRecipients(
                 Message.RecipientType.TO,
                 InternetAddress.parse(recipient)
         );
         message.setSubject("Phoenix password reset");
         message.setText("Dear User,"
                 + "\n\n Your new password is "+newPassword+".");

         Transport.send(message);

         System.out.println("Done");

     } catch (MessagingException e) {
         e.printStackTrace();
     }

   }  
}  