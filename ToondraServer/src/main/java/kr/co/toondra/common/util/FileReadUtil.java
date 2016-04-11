package kr.co.toondra.common.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;

public class FileReadUtil {
	
	public String fileRead(String Path) {

		BufferedReader br = null;        
	     
	    InputStreamReader isr = null;    
	     
	    FileInputStream fis = null;        

	    File file = new File(Path);

	    String temp = "";
	     
	    String content = "";
	     
	    try {
	         
	        fis = new FileInputStream(file);
	         
	        isr = new InputStreamReader(fis, "UTF-8");
	         
	        br = new BufferedReader(isr);
	     
	        while( (temp = br.readLine()) != null) {
	            content += temp;
	        }
	         
	         
	    } catch (FileNotFoundException e) {
	        e.printStackTrace();
	         
	    } catch (Exception e) {
	        e.printStackTrace();
	         
	    } finally {

	        try {
	            fis.close();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	         
	        try {
	            isr.close();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	         
	        try {
	            br.close();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	         
	    }
	    
	    return content;
	}


}
