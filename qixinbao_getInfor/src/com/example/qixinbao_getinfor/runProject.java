package com.example.qixinbao_getinfor;

import com.qixinbao.download.information;
import com.qixinbao.network.sendhttpUrlconnectionNearbyf;

import android.util.Log;

public class runProject {
	
	public static String Startrun(int i,String url,String longitude,String latitude,String city,String province) {
		String resp = "";
		String str = "null";
		String start ="";
		
        Log.i("qxb", "lng:"+longitude+"--lat:"+latitude);
        String distance = "3";
		
			try {
				start = String.valueOf(i);
				Log.i("qxb", "---从第" + start + "条开始下载---");
				resp = sendhttpUrlconnectionNearbyf.getNearbyList(longitude, latitude, distance, start);
//				Log.i("qxb", "返回的参数："+resp);
				if (!resp.equals("")) {
					str = information.getinformation(resp, longitude, latitude,city,province);
				}else {
					Startrun(i, url, longitude, latitude,city,province);
				}
			} catch (NullPointerException e) {
				Log.e("qxb", "NullPointerException错误："+resp);
			}catch (Exception e) {
				Log.e("qxb", e.toString());
			}
			
			
//			Log.i("qxb",start+"\n"+str);
			sleep(5);
		
		return resp;
        
	}
	
	
	
	public static void sleep(int time) {
		try {
			Thread.sleep(1000 * time);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
