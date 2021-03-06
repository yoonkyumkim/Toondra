package kr.co.toondra.web.sample.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import kr.co.toondra.common.util.MailSender;
import kr.co.toondra.web.sample.dao.SampleDao;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SampleService extends SqlSessionDaoSupport {

	@Autowired
	SampleDao dao;
	@Autowired
	MailSender sender;
	
	
	public List<HashMap<String, Object>> insertList() {
		
		dao.insertComment();
//		dao.insertComment2();
		
		return dao.getGetTogetherList();
	}
	
	
	public int sendEmail(){
		
		try{
			
//			sender.sendSmtpMail("pparbk@ahope.co.kr", "스프링메일테스트", "내용 테스트<html><head><title>Home</title></head><body><button >ajax go</button></body></html>");
			sender.sendSmtpGMail("pparbk@ahope.co.kr", "스프링메일테스트", "내용 테스트<html><head><title>Home</title></head><body><button >ajax go</button></body></html>",new File("C:/","test.txt"));
//			sender.sendSmtpGMail("pparbk@ahope.co.kr", "스프링메일테스트", "내용 테스트<html><head><title>Home</title></head><body><button >ajax go</button></body></html>",new File("/home/","test.txt"));
		}catch(Exception e){
			e.printStackTrace();
			return 0; //실패
		}
		
		return 1; //성공
		
	}
}
