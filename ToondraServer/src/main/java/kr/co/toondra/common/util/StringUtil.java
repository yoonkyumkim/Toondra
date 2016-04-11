package kr.co.toondra.common.util;

import java.util.Random;

public class StringUtil {
	
	public static String getRandomString(int length) {
		
		StringBuffer buf = new StringBuffer();
		Random random = new Random();
		
		String chars[] = "A,B,C,D,E,F,G,H,I,J,K,L,N,M,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,1,2,3,4,5,6,7,8,9,0".split(",");
		
		for(int i = 0; i < length; i++) {
			buf.append(chars[random.nextInt(chars.length)]);
		}
		
		return buf.toString();
	}

}
