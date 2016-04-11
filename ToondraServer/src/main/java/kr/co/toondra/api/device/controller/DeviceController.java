package kr.co.toondra.api.device.controller;

import java.util.HashMap;

import kr.co.toondra.api.common.controller.BaseController;
import kr.co.toondra.api.device.service.DeviceService;
import kr.co.toondra.common.util.CommonUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/api")
@Controller("apiDeviceController")
public class DeviceController extends BaseController {

	
	@Autowired
	private DeviceService service;
	
	
	//기기 등록
	@RequestMapping(value = "/device/key", method = RequestMethod.POST)
	public String insertDeviceKey(@RequestParam HashMap<String, Object> param, Model model) throws Exception{

		CommonUtil.paramCheck(param, new String[] {"device_os", "device_id", "enc_key", "reg_id"});
				
		model.addAttribute("result", service.insertDeviceKey(param));

		return JSON_VIEW;
	}
	
}
