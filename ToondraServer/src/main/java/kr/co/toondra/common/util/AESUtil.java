package kr.co.toondra.common.util;

import java.security.Key;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

public class AESUtil {
	private String key = "";
	
	public void setKey(String data) {
		key = data;
	}

	public String encrypt(String s) throws Exception {
		if (key.equals("")) {
			return "";
		}
		
        String encrypted = null;
        try {
            SecretKeySpec skeySpec = new SecretKeySpec(key.getBytes(), "AES");
              
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
            cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
             
            encrypted = byteArrayToHex(cipher.doFinal(s.getBytes()));
            return encrypted;
        } catch (Exception e) {
            
            throw e;
        }
    }
     
    // key는 16 바이트로 구성 되어야 한다.
	public String decrypt(String s) throws Exception {
		if (key.equals("")) {
			return "";
		}
        String decrypted = null;
        try {
            SecretKeySpec skeySpec = new SecretKeySpec(key.getBytes(), "AES");
             
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
            cipher.init(Cipher.DECRYPT_MODE, skeySpec);
            decrypted = new String(cipher.doFinal(hexToByteArray(s)));
            return decrypted;
        } catch (Exception e) {
            throw e;
        }
    }
	
	public static String randomKeyEncrypt(String s, Key randomKey)  {

	       String encrypted = null;
	       try {

	           Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
	           cipher.init(Cipher.ENCRYPT_MODE, randomKey);

	           encrypted = byteArrayToHex(cipher.doFinal(s.getBytes()));
	           return encrypted;
	       } catch (Exception e) {
	           e.printStackTrace();
	       }
	       return null;
	   }
	
    public static String randomKeyDecrypt(String s, Key randomKey) {
        String decrypted = null;
        try {

            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
            cipher.init(Cipher.DECRYPT_MODE, randomKey);
            decrypted = new String(cipher.doFinal(hexToByteArray(s)));
            return decrypted;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public byte[] EncryptByteArray(byte[] array) throws Exception
    {
        Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
        SecretKeySpec secretKey = new SecretKeySpec(key.getBytes(), "AES");
        cipher.init(Cipher.ENCRYPT_MODE, secretKey);
        return cipher.doFinal(array);
    }

    public byte[] decryptByteArray(byte[] strToDecrypt) throws Exception
    {
        Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
        SecretKeySpec secretKey = new SecretKeySpec(key.getBytes(), "AES");
        cipher.init(Cipher.DECRYPT_MODE, secretKey);
        return cipher.doFinal(strToDecrypt);
    }
     
	public static byte[] hexToByteArray(String s) {
        byte[] retValue = null;
        if (s != null && s.length() != 0) {
            retValue = new byte[s.length() / 2];
            for (int i = 0; i < retValue.length; i++) {
                retValue[i] = (byte) Integer.parseInt(s.substring(2 * i, 2 * i + 2), 16);
            }
        }
        return retValue;
    }
     
	public static String byteArrayToHex(byte buf[]) {
        StringBuffer strbuf = new StringBuffer(buf.length * 2);
        for (int i = 0; i < buf.length; i++) {
            if (((int) buf[i] & 0xff) < 0x10) {
                strbuf.append("0");
            }
            strbuf.append(Long.toString((int) buf[i] & 0xff, 16));
        }
         
        return strbuf.toString();
    }
}
