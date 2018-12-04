package com.p040a;


public class C0694a {
	 public static byte[] m1839a(String str) {
	        int length = str.length() / 2;
	        if (length % 2 != 0) {
	            throw new IllegalArgumentException();
	        }
	        byte[] bArr = new byte[length];
	        for (int i = 0; i < length; i++) {
	            bArr[i] = Integer.valueOf(str.substring(i * 2, (i * 2) + 2), 16).byteValue();
	        }
	        return bArr;
	    }

}
