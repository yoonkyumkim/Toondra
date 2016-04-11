package kr.co.toondra.api.login.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import kr.co.toondra.api.login.service.LoginApiService;
import kr.co.toondra.common.collection.PMap;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class LoginApiController {
	
	protected Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	LoginApiService service = new LoginApiService();

	@RequestMapping(value = "/api/member/login")
	public ResponseEntity<Object> login(HttpServletRequest request, Model model, RedirectAttributes ra){
		logger.debug("[ST][/login]");
		HashMap<String, Object> map = new HashMap<String, Object>();
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		if(service.login(new PMap(request))) {
			HashMap<String, Object> result = new HashMap<String, Object>();
			HashMap<String, Object> data = new HashMap<String, Object>();
			data.put("login_key", "1234");
			data.put("push_yn", "y");
			data.put("email", "kyum@ahope.co.kr");
			result.put("resp_code", "200");
			result.put("data", data);
			map.put("result", result);
			logger.debug("[ED][/login]");
			return new ResponseEntity<Object>(map, headers, HttpStatus.OK);
		}
		ra.addFlashAttribute("result", "false");
		logger.debug("[ED][/login]");
		return new ResponseEntity<Object>(map, headers, HttpStatus.OK);
	}
}
