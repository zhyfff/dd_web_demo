package com;

import com.p040a.C0695b;

public class MessageUtil {
	
	 public static native String getDECKey();

	    public static native String getIV();

	    public static native String getKey();

	    public static native String getShareKey();

	 public static String m1838a(String str) {
	        return C0695b.m1840a(str);
	    }
	 
	 static {
	        System.loadLibrary("encrypt-lib");
	    }


}
