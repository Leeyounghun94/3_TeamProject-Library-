package kr.co.librarylyh.service;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class MailSendService {
	@Autowired
	private JavaMailSenderImpl mailSender;
	private int authNumber;
	
	public void makeRandomNum() {
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		System.out.println("인증번호 : " + checkNum);
		authNumber = checkNum;
	}
	
	public String joinEmail(String email) {
		makeRandomNum();
		String setFrom = "";		// 보내는 이메일 주소
 		String toMail = email;							// 수신 받을 이메일
 		String title = "회원가입 인증 이메일 입니다.";	// 이메일 제목
 		String content = 								// 이메일 내용
 				"홈페이지를 방문해주셔서 감사합니다." +
 				"<br><br>" +
 				"인증번호는 <" + authNumber + "> 입니다." +
 				"<br>" +
 				"해당 인증번호를 인증번호 확인란에 기입하세요.";
 		mailSend(setFrom, toMail, title, content);
 		return Integer.toString(authNumber);
	}

	private void mailSend(String setFrom, String toMail, String title, String content) {
		MimeMessage message = mailSender.createMimeMessage();
		
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
}
