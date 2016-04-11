package kr.co.toondra.common.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import kr.co.toondra.common.collection.PMap;
import kr.co.toondra.common.util.PostApi;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class CommonController {
	
	@Autowired
	PostApi post = new PostApi();

	@RequestMapping("/getPost")
	public ResponseEntity<Object> getPost(HttpServletRequest request) {
		PMap pMap = new PMap(request);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map = post.getPost(pMap);
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		return new ResponseEntity<Object>(map, headers, HttpStatus.OK);
	}
}
