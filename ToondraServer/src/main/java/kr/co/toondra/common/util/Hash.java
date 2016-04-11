package kr.co.toondra.common.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import kr.co.toondra.common.exception.LogicException;

public class Hash {
	public static String sha512(String hashData) throws Exception{

		MessageDigest md;
		String result = "";
		
		try {
            md= MessageDigest.getInstance("SHA-512");
 
            md.update(hashData.getBytes());
            byte[] mb = md.digest();
            for (int i = 0; i < mb.length; i++) {
                byte temp = mb[i];
                String s = Integer.toHexString(new Byte(temp));
                while (s.length() < 2) {
                    s = "0" + s;
                }
                s = s.substring(s.length() - 2);
                result += s;
            }
 
        } catch (NoSuchAlgorithmException e) {
            throw new LogicException("Hash512 Error", "407");
        }
		
		return result;
	}
}
