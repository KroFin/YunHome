package com.hopu.utils;

import com.sun.mail.util.MailSSLSocketFactory;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.security.GeneralSecurityException;
import java.util.Properties;

public class MailUtil {

    static Properties properties;
    static Message msg;
    static Transport transport;

    public MailUtil() {
        properties = new Properties();

        properties.setProperty("mail.debug", "true");
        properties.setProperty("mail.smtp.auth", "true");
        properties.setProperty("mail.host", "smtp.qq.com");
        properties.setProperty("mail.transport.protocol", "smtp");

        try {
            MailSSLSocketFactory sf = new MailSSLSocketFactory();
            sf.setTrustAllHosts(true);
            properties.put("mail.smtp.ssl.enable", "true");
            properties.put("mail.smtp.ssl.socketFactory", sf);
        } catch (GeneralSecurityException e) {
            e.printStackTrace();
        }


        Session session = Session.getInstance(properties);

        msg = new MimeMessage(session);

        try {
            msg.setSubject("HOPU租房网密码重置");
            msg.setFrom(new InternetAddress("2649104088@qq.com"));

            transport = session.getTransport();
            transport.connect("smtp.qq.com", "2649104088@qq.com","kppacwoscbltecca");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    public void sendMail(String address, String text) throws AddressException, MessagingException {
        msg.setText(text);
        transport.sendMessage(msg, new Address[]{new InternetAddress(address)});
        transport.close();
    }
}

