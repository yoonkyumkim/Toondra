package kr.co.toondra.api.image.controller;

import javax.servlet.http.HttpServletRequest;

import kr.co.toondra.api.common.controller.BaseController;
import kr.co.toondra.api.image.service.ImageService;
import kr.co.toondra.common.collection.PMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ImageController extends BaseController {
	
	@Autowired
	ImageService service  = new ImageService();

	@RequestMapping(value="/api/image/thumbnail/{workSeq}", method=RequestMethod.GET)
	public ResponseEntity<byte[]> thumbnailView(@PathVariable String workSeq,HttpServletRequest request) throws Exception{
		
		PMap pMap = new PMap(request);
		pMap.put("work_seq", workSeq);
		pMap = service.getThumbnail(pMap);
		byte[] img = null;
		if(pMap.containsKey("image")) {
			img = (byte[]) pMap.get("image");
		}
		String type = pMap.getString("type");
		HttpHeaders headers = new HttpHeaders();
		if(type.equals(".jpg")){
			headers.setContentType(MediaType.IMAGE_JPEG);
		}
		if(type.equals(".gif")){
			headers.setContentType(MediaType.IMAGE_GIF);
		}
		return new ResponseEntity<byte[]>(img, headers, HttpStatus.OK);
	}
	
	@RequestMapping(value="/api/image/content/thumbnail/{contentSeq}", method=RequestMethod.GET)
	public ResponseEntity<byte[]> contentThumbnailView(@PathVariable String contentSeq,HttpServletRequest request) throws Exception {
		
		PMap pMap = new PMap(request);
		pMap.put("content_seq", contentSeq);
		pMap = service.getContentThumbnail(pMap);
		byte[] img = null;
		if(pMap.containsKey("image")){
			img = (byte[]) pMap.get("image");
		}
		String type = pMap.getString("type");
		HttpHeaders headers = new HttpHeaders();
		if(type.equals(".jpg")){
			headers.setContentType(MediaType.IMAGE_JPEG);
		}
		if(type.equals(".gif")){
			headers.setContentType(MediaType.IMAGE_GIF);
		}
		return new ResponseEntity<byte[]>(img, headers, HttpStatus.OK);
	}
	
	@RequestMapping(value="/api/image/content/{workSeq}/{contentSeq}/{imgName:.+}", method=RequestMethod.GET)
	public ResponseEntity<byte[]> contentView(@PathVariable String workSeq, @PathVariable String contentSeq, @PathVariable String imgName, HttpServletRequest request) throws Exception {

		PMap pMap = new PMap(request);
		
		pMap.put("work_seq", workSeq);
		pMap.put("content_seq", contentSeq);
		pMap.put("file_img_name", imgName);
		
		pMap = service.getContentImage(pMap);
		
		byte[] img = null;
		if(pMap.containsKey("image")){
			img = (byte[])pMap.get("image");
		}
		
		String type = pMap.getString("type");
		
		HttpHeaders headers = new HttpHeaders();
		
		if(type.equals(".jpg")){
			headers.setContentType(MediaType.IMAGE_JPEG);
		}
		
		if(type.equals(".gif")){
			headers.setContentType(MediaType.IMAGE_GIF);
		}
		
		return new ResponseEntity<byte[]>(img, headers, HttpStatus.OK);
	}


}
