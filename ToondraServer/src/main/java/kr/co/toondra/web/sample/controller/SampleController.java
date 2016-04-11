package kr.co.toondra.web.sample.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.toondra.api.common.controller.BaseController;
import kr.co.toondra.common.collection.PMap;
import kr.co.toondra.web.sample.service.SampleService;
import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/admin/sample")
public class SampleController extends BaseController{
	
	
	@Autowired
	SampleService service;
	
	
	protected Logger logger = LoggerFactory.getLogger(this.getClass());	
	
	@RequestMapping(value="/sampleList")
	public String sampleList(HttpServletRequest request, Model model) throws Exception {
		logger.debug("[ST][/sampleList]");
//		model.addAttribute("data",service.insertList());
		logger.debug("[ED][/sampleList]");
		
		return "toondra/sample/sample";
	}
	
	
	
	
	
	@RequestMapping(value="/testDatatable",method = RequestMethod.POST)
	public @ResponseBody String testDatatable(HttpServletRequest request, Model model) throws Exception {
		logger.debug("[ST][/testDatatable]");
//		model.addAttribute("data",service.insertList());
		
		PMap pMap = new PMap(request);
		System.out.println("pMap : " + pMap);
		HashMap<String, Object> testMap1 = new HashMap<String, Object>();
		testMap1.put("name", "둘리");
		testMap1.put("age", "1");
		HashMap<String, Object> testMap2 = new HashMap<String, Object>();
		testMap2.put("name", "또치");
		testMap2.put("age", "2");
		HashMap<String, Object> testMap3 = new HashMap<String, Object>();
		testMap3.put("name", "희동이");
		testMap3.put("age", "3");
		HashMap<String, Object> testMap4 = new HashMap<String, Object>();
		testMap4.put("name", "도우너");
		testMap4.put("age", "4");
		
		List<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
		
		list.add(testMap1);
		list.add(testMap2);
		list.add(testMap3);
		list.add(testMap4);
		
		
		pMap.put("aaData", list);
		
		model.addAttribute(pMap);
		logger.debug("[ED][/testDatatable]");
		JSONObject json = new JSONObject();
		
		json.putAll(pMap);

		
		
		
		
		return json.toString();
	}
		
	@RequestMapping(value="/mailTest")
	public String mailTest(HttpServletRequest request, Model model) {
		
		service.sendEmail();
		
		return "jacksonView";
	}
	
	@RequestMapping(value="/upfileTest")
	public ModelAndView upfileTest2(HttpServletRequest request) {
		logger.debug("[ST][/upfileTest2]");
		
		
		
		logger.debug("[ED][/upfileTest2]");
		
		return new ModelAndView("toondra/sample/sample");
	}
	
	public ModelAndView upfileTest(HttpServletRequest request) {
		
		logger.debug("[ST][/upfileTest]");
		
		
		try{
			System.out.println("변환가능?");
			if(request instanceof MultipartHttpServletRequest){
				System.out.println("변환ok");
				MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
					    
				Iterator<String> fileNameList = multiRequest.getFileNames();
				
//				while(fileNameList.hasNext()){
					     
//					System.out.println("--next:"+fileNameList.next());
					List<MultipartFile> mFiles = multiRequest.getFiles(fileNameList.next());
					for(MultipartFile mFile : mFiles){
						System.out.println("original file name : " + mFile.getOriginalFilename());
					}
					/*
					String oriFileName = mFile.getOriginalFilename();	
					System.out.println("fileName : " +oriFileName);
					String fileExt = oriFileName.substring(oriFileName.lastIndexOf(".")+1);
					 
					fileExt = fileExt.toUpperCase();
					
					//local
					String filePath = "D:/img/";
					     
					//server
	//				String filePath = "/home/mrpark/upFile/";
					mFile.transferTo(new File(filePath + oriFileName));
					 */
//				}
		    
			}
		} catch(Exception ioe){
			System.out.println("업로드실패");
			ioe.printStackTrace();
		}
		
		
		
		logger.debug("[ED][/upfileTest]");
		
		
		return new ModelAndView("toondra/sample/sample"); 
	}
	
	@RequestMapping("/exelTest")
	public String exelTest(HttpServletRequest request, HttpServletResponse response, Model model) {
		logger.debug("[ST][/exelTest]");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("aaData", new ArrayList());
		model.addAllAttributes(map);
		logger.debug("[ED][/exelTest]");  
		  
		return "ExcelSampleView";
	}

	
}
