package kr.co.toondra.common.util;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;








import kr.co.toondra.common.collection.PMap;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class PostApi {
	@Value("${post.api}")
	private String API;
	
	@Value("${post.reg_key}")
	private String REG_KEY;
	
	public HashMap<String, Object> getPost(PMap pMap) {
		URLConnection conn = null;
		List<Element> list = null;
		List<HashMap<String,Object>> zipList = new ArrayList<HashMap<String,Object>>();
		InputStream is = null;
		//조회할 형식 post = 우편번호 검색, postRoad = 도로명 검색
		String target = pMap.getString("target");
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			URL url = new URL(API + "?regkey=" + REG_KEY + "&target=" + target + "&query=" 
					+ URLEncoder.encode(pMap.getString("zip"), "EUC-KR"));
			conn = url.openConnection();
			conn.setRequestProperty("accept-language", "ko");
			
			SAXBuilder builder = new SAXBuilder();
			is = conn.getInputStream();
			
			Document doc = builder.build(is);
			if(doc.getRootElement().getChildText("error_code") != null) {
				map.put("resp_code", "404");
				HashMap<String, Object> data = new HashMap<String, Object>();
				data.put("error_code", doc.getRootElement().getChildText("error_code"));
				data.put("message", doc.getRootElement().getChildText("message"));
				zipList.add(data);
				map.put("data", zipList);
				
				return map;
			} 
			
			Element itemlist = doc.getRootElement().getChild("itemlist");
			list = itemlist.getChildren();
			if(list != null){
				if(target.equals("post")) {
					for(int i = 0; i < list.size(); i++) {
						Element item = list.get(i);
						HashMap<String, Object> data = new HashMap<String, Object>();
						data.put("address", item.getChildText("address"));
						data.put("postcd", item.getChildText("postcd"));
						zipList.add(data);
					}
				} else {
					for(int i = 0; i < list.size(); i++) {
						Element item = list.get(i);
						HashMap<String, Object> data = new HashMap<String, Object>();
						data.put("address", item.getChildText("lnmAddress"));
						data.put("rnAddress", item.getChildText("rnAddress"));
						data.put("postcd", item.getChildText("postCd"));
						zipList.add(data);
					}
				}
				map.put("resp_code", "200");
				map.put("data", zipList);
			} else {
				map.put("resp_code", "404");
			}
			
		} catch (MalformedURLException e) {
			map.put("resp_code", "404");
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			map.put("resp_code", "404");
			e.printStackTrace();
		} catch (IOException e) {
			map.put("resp_code", "404");
			e.printStackTrace();
		} catch (JDOMException e) {
			map.put("resp_code", "404");
			e.printStackTrace();
		} finally {
			try {
				if(is!=null) {is.close();}
				} catch (IOException e) {
					map.put("resp_code", "404");
					e.printStackTrace();
				}
			}
		return map;
		
	}

}
