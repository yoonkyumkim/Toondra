package kr.co.toondra.common.util;

public class Base64 {
	
	private final static String BASE64_STR = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
	
	public static String encodeString(String str) {
		return new String(encode(str.getBytes(), 0, str.getBytes().length));
	}
	
	public static String encodeString(byte[] bytes) {
		return new String(encode(bytes, 0, bytes.length));
	}
	
	public static byte[] encode(String str) {
		return encode(str.getBytes(), 0, str.getBytes().length);
	}
	
	public static byte[] encode(byte[] bytes) {
		return encode(bytes, 0, bytes.length);
	}
	
	public static byte[] encode(byte[] bytes, int offset, int len) {
		
		int outDataLen = ((len*4)+2)/3;
		int outLen = ((len+2)/3)*4;
		byte[] outData = new byte[outLen];
		
		int inLen = offset + len;
		int outOffset = 0;
		while (offset < inLen) {
			int in1 = bytes[offset++] & 0xff;
			int in2 = ((offset < inLen) ? (bytes[offset++] & 0xff) : 0);
			int in3 = ((offset < inLen) ? (bytes[offset++] & 0xff) : 0);
			int out1 = in1 >>> 2;
			int out2 = ((in1 & 0x3) << 4) | (in2 >>> 4);
			int out3 = ((in2 & 0xf) << 2) | (in3 >>> 6);
			int out4 = in3 & 0x3F;
			outData[outOffset++] = (byte)BASE64_STR.charAt(out1);
			outData[outOffset++] = (byte)BASE64_STR.charAt(out2);
			outData[outOffset] = (byte)((outOffset < outDataLen) ? BASE64_STR.charAt(out3) : '=');
			outOffset++;
			outData[outOffset] = (byte)((outOffset < outDataLen) ? BASE64_STR.charAt(out4) : '=');
			outOffset++;
		}
		return outData;
	}
	
	public static String decodeString(String str) {
		return new String(decode(str.getBytes(), 0, str.getBytes().length));
	}
	
	public static String decodeString(byte[] bytes) {
		return new String(decode(bytes, 0, bytes.length));
	}
	
	public static byte[] decode(String str) {
		return decode(str.getBytes(), 0, str.getBytes().length);
	}
	
	public static byte[] decode(byte[] bytes) {
		return decode(bytes, 0, bytes.length);
	}
	
	public static byte[] decode(byte[] bytes, int offset, int len) {

		if (len%4 != 0) {
			throw new IllegalArgumentException ("Length of Base64 encoded input string is not a multiple of 4.");
		}
		
		while (len > 0 && bytes[offset+len-1] == '=') {
			len--;
		}
		
		int outLen = (len*3)/4;
		byte[] outData = new byte[outLen];
		
		int inLen = offset + len;
		int outOffset = 0;
		while (offset < inLen) {
			int in1 = bytes[offset++];
			int in2 = bytes[offset++];
			int in3 = ((offset < inLen) ? bytes[offset++] : 'A');
			int in4 = ((offset < inLen) ? bytes[offset++] : 'A');
			if (in1 > 127 || in2 > 127 || in3 > 127 || in4 > 127) {
				throw new IllegalArgumentException ("Illegal character in Base64 encoded data.");
			}
			
			int out1 = BASE64_STR.indexOf(in1);
			int out2 = BASE64_STR.indexOf(in2);
			int out3 = BASE64_STR.indexOf(in3);
			int out4 = BASE64_STR.indexOf(in4);
			if (out1 < 0 || out2 < 0 || out3 < 0 || out4 < 0) {
				throw new IllegalArgumentException ("Illegal character in Base64 encoded data.");
			}
			
			outData[outOffset++] = (byte)((out1 << 2) | (out2 >>> 4));
			if (outOffset < outLen) {
				outData[outOffset++] = (byte)(((out2 & 0xf) << 4) | (out3 >>> 2));
			}
			if (outOffset < outLen) {
				outData[outOffset++] = (byte)(((out3 & 0x3) << 6) | out4);
			}
		}
		return outData;
	}
}
