package cn.it.shop.util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

/**
 * 完成邮件的发送
 * @author Administrator
 *
 */
public class MessageUtilImpl {
	public static void main(String[] args) throws Exception {
		//登录右键客户端(创建会话 Session)
		Properties props = new Properties();
		props.put("mail.transport.protocol", "smtp");
		//创建session会话 javax.mail.session
		Session session = Session.getDefaultInstance(props);
		//设置debug模式调试发送信息
		session.setDebug(true);
		//创建一封右键对象
		Message message = new MimeMessage(session);
		//写信
		message.setSubject("订单支付成功邮件");
		//正文内容
		message.setContent("----中国人----", "text/html;charset=utf-8");
		//发件人地址
		message.setFrom(new InternetAddress("sherry9_aptx4869@163.com"));
		//设置连接邮件服务器的认证信息
		Transport transport = session.getTransport();
		transport.connect("smtp.163.com", "sherry9_aptx4869", "zts53402");
		//设置收件人地址并且发送邮件
		transport.sendMessage(message, new InternetAddress[]{new InternetAddress("voldemero@gmail.com")});
		transport.close();
		
		
	}
}
