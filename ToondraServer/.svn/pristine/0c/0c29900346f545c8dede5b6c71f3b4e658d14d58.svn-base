package kr.co.toondra.common.util;

import java.io.File;
import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class MailSender {
	
	@Value("${mail.host}")
	private String HOST;
	@Value("${mail.protocol}")
	private String PROTOCOL;
	@Value("${mail.smtp.socket}")
	private String SOCKET;
	@Value("${mail.smtp.port}")
	private String PORT;
	@Value("${mail.auth.email}")
	private String AUTH_EMAIL;
	@Value("${mail.auth.passwd}")
	private String AUTH_PASSWD;
	@Value("${mail.from.email}")
	private String FROM_EMAIL;
	@Value("${mail.from.name}")
	private String FROM_NAME;
	

	private Properties props = null;
	

	/**
	 * SMTP(localhost Server)를 이용하여 Mail발송
	 * @param to 받는 사람 E-mail주소
	 * @param subject E-Mail제목
	 * @param content E-Mail내용
	 * */
	public void sendSmtpMail(String to, String subject, String content) throws Exception {
		
		props = new Properties();
		props.put("mail.smtp.host", HOST);
		
		Message msg = createMessage(FROM_EMAIL, FROM_NAME, to);
		msg.setSubject(subject);
		msg.setSentDate(new Date());
		msg.setText(content);
		msg.setContent(content, "text/html;charset=utf-8");
		
		Transport.send(msg);
	}
	
	/**
	 *SMTP(localhost Server)를 이용하여 첨부파일 Mail발송
	 * 
	 * @param to 받는 사람 E-mail주소
	 * @param subject E-Mail제목
	 * @param content E-Mail내용
	 * @param attach E-Mail 첨부파일
	 * */
	public void sendSmtpMail(String to, String subject, String content, File attach) throws Exception {
		
		props = new Properties();
		props.put("mail.smtp.host", HOST);
		
		Message msg = createMessage(FROM_EMAIL, FROM_NAME, to);
		
		msg.setSubject(subject);
		
		msg.setSentDate(new Date());
		
		Multipart multiPart = new MimeMultipart();  
		
	    MimeBodyPart messageText = new MimeBodyPart();  
	    messageText.setContent(content, "text/html;charset=utf-8");  
	    multiPart.addBodyPart(messageText);  
	
        MimeBodyPart Attachment = new MimeBodyPart();  
        FileDataSource File = new FileDataSource(attach);
        Attachment.setDataHandler(new DataHandler(File));  
        Attachment.setFileName(MimeUtility.encodeText(File.getName()));  
        multiPart.addBodyPart(Attachment);
        
        msg.setContent(multiPart, "text/html;charset=utf-8");  
		
		
		Transport.send(msg);
	}

	
	
	/**
	 * SMTP(GMAIL SERVER)를 이용하여 Mail발송
	 * 
	 * @param authId 인증ID
	 * @param authPasswd 인증Password
	 * @param from 보내는 사람 E-Mail주소
	 * @param fromName 보내는 사람 표현 이름
	 * @param to 받는 사람 E-mail주소
	 * @param cc 참조 E-Mail주소
	 * @param bcc 숨은 참조 E-Mail주소
	 * @param subject E-Mail제목
	 * @param content E-Mail내용
	 * */
	public void sendSmtpGMail(String to, String subject, String content) throws Exception {
		
		props = new Properties();
		
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.transport.protocol", PROTOCOL);
		
		props.put("mail.smtp.host", HOST);
		props.setProperty("mail.smtp.socketFactory.class", SOCKET);
		props.put("mail.smtp.port", String.valueOf(PORT));
		
		Message msg = createMessage(AUTH_EMAIL, AUTH_PASSWD, FROM_EMAIL, FROM_NAME, to);
		
		msg.setSubject(subject);
		msg.setSentDate(new Date());
		msg.setContent(content, "text/html;charset=utf-8");
		
		Transport.send(msg);
	}
	
	
	/**
	 *SMTP(GMAIL SERVER)를 이용하여 첨부파일 Mail발송
	 * 
	 * @param authId 인증ID
	 * @param authPasswd 인증Password
	 * @param from 보내는 사람 E-Mail주소
	 * @param fromName 보내는 사람 표현 이름
	 * @param to 받는 사람 E-mail주소
	 * @param cc 참조 E-Mail주소
	 * @param bcc 숨은 참조 E-Mail주소
	 * @param subject E-Mail제목
	 * @param content E-Mail내용
	 * @param attach E-Mail 첨부파일
	 * */
	public void sendSmtpGMail(String to, String subject, String content, File attach) throws Exception  {
		
		props = new Properties();
		
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.transport.protocol", PROTOCOL);
		
		props.put("mail.smtp.host", HOST);
		props.setProperty("mail.smtp.socketFactory.class", SOCKET);
		props.put("mail.smtp.port", String.valueOf(PORT));
		
		Message msg = createMessage(AUTH_EMAIL, AUTH_PASSWD, FROM_EMAIL, FROM_NAME, to);
		
		msg.setSubject(subject);
		msg.setSentDate(new Date());
		
		Multipart multiPart = new MimeMultipart();  
		
	    MimeBodyPart messageText = new MimeBodyPart();  
	    messageText.setContent(content, "text/html;charset=utf-8");  
	    multiPart.addBodyPart(messageText);  
	
        MimeBodyPart Attachment = new MimeBodyPart();  
        FileDataSource File = new FileDataSource(attach);
        Attachment.setDataHandler(new DataHandler(File));  
        Attachment.setFileName(MimeUtility.encodeText(File.getName()));  
        multiPart.addBodyPart(Attachment);
        
        msg.setContent(multiPart, "text/html;charset=utf-8");  
        
		Transport.send(msg);
	}
	
	
	
	
	
	
	
	
	
	
	private Message createMessage(String from, String fromName, String to) throws Exception {
		Session mailSession = Session.getDefaultInstance(props);
		
		Message msg = new MimeMessage(mailSession);
		
		msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B")));
		msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
	
		return msg;
	}
	
	private Message createMessage(String authId, String authPasswd, String from, String fromName, String to) throws Exception {
		GmailSmtpAuthenticator auth = new GmailSmtpAuthenticator(authId, authPasswd);
		Session mailSession = Session.getDefaultInstance(props, auth);
		
		Message msg = new MimeMessage(mailSession);
		
		msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B")));
		msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
		
		return msg;
	}
	
	
	private static class GmailSmtpAuthenticator extends Authenticator {
		private String id = null;
		private String passwd = null;
		
		public GmailSmtpAuthenticator(String id, String passwd) {
			this.id = id;
			this.passwd = passwd;
		}
		
		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(id, passwd);
		}
	}
}