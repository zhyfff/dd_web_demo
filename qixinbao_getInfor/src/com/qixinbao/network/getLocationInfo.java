package com.qixinbao.network;
/*
 * 
 * 获取坐标点
 */
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLSocketFactory;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import com.qixinbao.network.utils.httpUtil;
import android.util.Log;

public class getLocationInfo {

	public static String getLocalpoint(String requesturl) {

		HttpURLConnection connection = null;
		String requestHeader = null;// 请求头
		byte[] requestBody = null;// 请求体
		String responseHeader = null;// 响应头
		byte[] responseBody = null;// 响应体
		String ss = "";
		try {
			URL url = new URL(requesturl);
			connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			connection.setConnectTimeout(8000);
			connection.setReadTimeout(8000);
			connection.setDoInput(true);
			connection.setUseCaches(false);
			requestHeader = httpUtil.getReqeustHeader(connection);
			InputStream is = connection.getInputStream();
			connection.connect();
			responseBody = httpUtil.getBytesByInputStream(is);
			ss = new String(responseBody, "utf-8");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Log.i("bx", "Exception:" + e);
		} finally {
			if (connection != null) {
				connection.disconnect();
			}
		}
		return ss;

	}

	/**
	 * 解析xml文件
	 * 
	 * @param xmlData
	 */
	public static Map<String,String> parseXmlWithPull(String xmlData) {
		Map <String,String> d = new HashMap<>();
		
		try {
			XmlPullParserFactory factory;
			factory = XmlPullParserFactory.newInstance();
			XmlPullParser xmlPullParser = factory.newPullParser();
			xmlPullParser.setInput(new StringReader(xmlData));
			int eventType = xmlPullParser.getEventType();
			
			String lng = "";
			String lat = "";
			String city = "";
			String province = "";
			while (eventType!=XmlPullParser.END_DOCUMENT) {
				 String nodeName=xmlPullParser.getName();
				 switch (eventType) {
				case XmlPullParser.START_TAG:
					if ("LngId".equals(nodeName)) {
						lng = xmlPullParser.nextText();
						d.put("lng", lng);
					}else if ("LatId".equals(nodeName)) {
						lat = xmlPullParser.nextText();
						d.put("lat", lat);
					}else if ("city".equals(nodeName)) {
						city = xmlPullParser.nextText();
						d.put("city", city);
					}else if ("province".equals(nodeName)) {
						province = xmlPullParser.nextText();
						d.put("province", province);
					}
					break;
				case XmlPullParser.END_TAG:
					if ("menu".equals(nodeName)) {
						Log.d("qxb", "经度"+lng);
						Log.d("qxb", "纬度"+lat);
					}
					break;
				default:
					break;
				}
			 eventType=xmlPullParser.next();

			}
			
		} catch (XmlPullParserException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return d;

	}

}
