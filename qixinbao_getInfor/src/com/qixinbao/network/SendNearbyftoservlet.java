package com.qixinbao.network;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;

import com.bertadata.qxb.api.Myconfig;

import android.util.Log;

public class SendNearbyftoservlet {
	
	public static void sendPost(String resp) {
		HttpURLConnection connection = null;
		 try {  
             URL url = new URL("http://"+Myconfig.getHost()+"/qxbinformation/servlet/MyServlet");  
             connection = (HttpURLConnection) url.openConnection();  
             connection.setRequestMethod("POST");  
             connection.setConnectTimeout(5000);  
             connection.setReadTimeout(5000);  
             connection.setRequestProperty("charset", "UTF-8");  
             connection.setDoOutput(true);  
             DataOutputStream out = new DataOutputStream(connection.getOutputStream());  
             //向服务器传送数据  
             out.writeBytes(URLEncoder.encode(resp,"utf-8"));  
             if (connection.getResponseCode() == 200) {  
                 InputStream in = connection.getInputStream();  
                 BufferedReader reader = new BufferedReader(new InputStreamReader(in));  
                 StringBuilder s = new StringBuilder();  
                 String line;  
                 //读取服务器返回的数据  
                 while ((line = reader.readLine()) != null) {  
                     s.append(line);  
                 }  
//                Log.i("qxb", "读取服务器返回的数据  :"+s.toString());
                 Log.i("qxb", "附近企业信息发送成功！！");
                reader.close();  
             }  
             out.close();  
         } catch (MalformedURLException e) {  
             e.printStackTrace();  
         } catch (IOException e) {  
             e.printStackTrace();  
         }finally {
			if (connection!=null) {
				connection.disconnect();
			}
		}  
		
	}

}
