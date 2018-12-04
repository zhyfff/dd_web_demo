package com.qixinbao.rcode;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.MessageUtil;
import com.bertadata.qxb.api.QXBApi;

import android.text.TextUtils;
import android.util.Log;
//SN-d513b8de8083300e

public class rc {
	public static final String ENCRYPTION_KEY = "4B58F6B4A4314415B6AFCAD47A66FB37";
	private static final String TOKEN = "token";
	
	public static Map<String,String> gettoken(HashMap<String, Object> hashMap,String url) {
		Map<String,String> mt = new HashMap<>();
		if (hashMap.containsKey("longitude")&&hashMap.containsKey("latitude")) {
			hashMap.put(TOKEN, MessageUtil.m1838a(hashMap.get("longitude") + hashMap.get("latitude").toString() + hashMap.get("distance") + hashMap.get("start").toString() + "SN-4d0006d6c44a7100" + ENCRYPTION_KEY));

		}else{
			 hashMap.put(TOKEN, MessageUtil.m1838a(hashMap.get("id") + "SN-4d0006d6c44a7100" + ENCRYPTION_KEY));
		}
		String bodytoken = "";
		try {
			bodytoken = URLEncoder.encode(hashMap.get("token").toString(),"utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		Log.i("qxb", bodytoken);
		String headtoken = a((Map) hashMap, url, true);
//		Log.i("qxb", headtoken);
		mt.put("headtoken", headtoken);
		mt.put("bodytoken", bodytoken);
		
		return mt;
	}
	
	
	private static String a(Map<String, Object> map, String str, boolean z) {
        StringBuilder stringBuilder = new StringBuilder();
        if (!(map == null || map.isEmpty())) {
            Object[] toArray = map.keySet().toArray();
            Arrays.sort(toArray);
            for (Object obj : toArray) {
//                String k = z.k(map.get(obj) == null ? "" : map.get(obj).toString());
            	String k = map.get(obj) == null ? "" : map.get(obj).toString();
                if (!TextUtils.isEmpty(k)) {
                    if (!QXBApi.TOKEN.equals(obj) || z) {
                        stringBuilder.append(k);
                    } else {
                    }
                }
//                Log.i("qxb","key = " + obj + " value = " + k);
            }
        }
        stringBuilder.append(a(str));
        return MessageUtil.m1838a(stringBuilder.toString());
    }

	 private static String a(String str) {
	        String str2 = "";
	        String qxb_folder = QXBApi.getQXB_FOLDER();
	        if (str.contains(QXBApi.QXB_FOLDER_V4)) {
	            qxb_folder = QXBApi.QXB_FOLDER_V4;
	        } else if (str.contains(QXBApi.QXB_FOLDER_APPB)) {
	            qxb_folder = QXBApi.QXB_FOLDER_APPB;
	        }
	        if (TextUtils.isEmpty(str) || !str.contains(qxb_folder)) {
	            Log.i("qxb","传入的URL 不符合请求方法的执行");
	        } else {
	            int indexOf = str.indexOf(qxb_folder);
	            if (indexOf > -1) {
	                return str.substring((qxb_folder.length() + indexOf) + 1);
	            }
	        }
	        return str2;
	    }
 

}
