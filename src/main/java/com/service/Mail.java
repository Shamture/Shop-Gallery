package com.service;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mail {

	public static boolean SendAnswer(String mail, String sujet, String answer) {
		// Sender's email ID needs to be mentioned
		String from = "boutique@gmail.com";// change accordingly
		final String username = "boutique";// change accordingly
		final String password = "1Wxcvbn,";// change
											// accordingly

		// on envoi l'email à travers relay.jangosmtp.net
		String host = "smtp.gmail.com";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", "587");

		// Get the Session object.
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {
			// Create a default MimeMessage object.
			Message message = new MimeMessage(session);

			// Set From: header field of the header.
			message.setFrom(new InternetAddress(from));

			// Set To: header field of the header.
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mail));

			// Set Subject: header field
			message.setSubject("Re-" + sujet);

			// Now set the actual message
			message.setContent("<p>" + answer + "</p>", "text/html");

			// Send message
			Transport.send(message);

			return true;

		} catch (MessagingException e) {

		}
		return false;
	}

	public static boolean varifieCode(int id, int code) {
		if ((code / 123456) == id)
			return true;
		return false;
	}

}
