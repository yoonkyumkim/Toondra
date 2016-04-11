package kr.co.toondra.common.util;


import java.security.KeyFactory;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;

import javax.crypto.Cipher;

public class RSAUtils {
	
	public static PublicKey getRSAPublickKey(String publicKeyBase64Str)	throws Exception {

		X509EncodedKeySpec spec = new X509EncodedKeySpec(Base64.decode(publicKeyBase64Str));

		KeyFactory kf = KeyFactory.getInstance("RSA");
		
		PublicKey pubKey = kf.generatePublic(spec);
		
		return pubKey;
	}

	public static PrivateKey getRSAPrivateKey(String privateKeyBase64Str) throws Exception {
		
		PKCS8EncodedKeySpec specPriv = new PKCS8EncodedKeySpec(Base64.decode(privateKeyBase64Str));
		
		KeyFactory kf = KeyFactory.getInstance("RSA");
		
		PrivateKey privateKey = kf.generatePrivate(specPriv);
		
		return privateKey;
	}

	public static String encPrivateRSA(PrivateKey privateKey, byte[] bytes) throws Exception {
		
		Cipher clsCipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
		
		clsCipher.init(Cipher.ENCRYPT_MODE, privateKey);
		
		byte[] arrCipherData = clsCipher.doFinal(bytes);
		
		String strCipher = Base64.encodeString(arrCipherData);
		
		
		return strCipher;
	}
	
	public static String encPublicRSA(PublicKey publicKey, byte[] bytes) throws Exception {
		
		Cipher clsCipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
		
		clsCipher.init(Cipher.ENCRYPT_MODE, publicKey);
		
		byte[] arrCipherData = clsCipher.doFinal(bytes);
		
		String strCipher = Base64.encodeString(arrCipherData);
		
		
		return strCipher;
	}

	public static String decPrivateRSA(PrivateKey privateKey, String base64EncStr) throws Exception {
		
		Cipher clsCipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
		
		clsCipher.init(Cipher.DECRYPT_MODE, privateKey);
		
		byte[] arrData = clsCipher.doFinal(Base64.decode(base64EncStr));
		
		String strResult = new String(arrData);
		
		
		return strResult;
	}
	
	public static String decPublicRSA(PublicKey publicKey, String base64EncStr) throws Exception {
		
		Cipher clsCipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
		
		clsCipher.init(Cipher.DECRYPT_MODE, publicKey);
		
		byte[] arrData = clsCipher.doFinal(Base64.decode(base64EncStr));
		
		String strResult = new String(arrData);
		
		
		return strResult;
	}
}
