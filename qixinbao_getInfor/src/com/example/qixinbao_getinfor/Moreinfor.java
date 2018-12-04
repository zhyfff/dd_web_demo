package com.example.qixinbao_getinfor;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;
import com.alibaba.fastjson.JSONObject;
import com.p040a.C0695b;
import com.qixinbao.network.sendMoreftoservlet;
import com.qixinbao.network.senhttpUrlconnectionMoref;

import android.os.Environment;
import android.util.Log;
public class Moreinfor {
	
//	static String data = "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";

	
	
	public static String getDta(String cid,String rlon,String rlat,String rcity,String rprovince) {
		String str = "";
		String recall = senhttpUrlconnectionMoref.getMoref(cid);
		JSONObject json = JSONObject.parseObject(recall);
		if (json.containsKey("data") && json.containsKey("message") && json.getString("message").equals("操作成功")) {
			String data = json.getString("data");
			str = C0695b.m1841b(data);
//			Log.i("qxb", "解密后:"+str);
//			String logPath = "";
//			if (Environment.getExternalStorageState().equals(
//	                Environment.MEDIA_MOUNTED)) {
//	            logPath = Environment.getExternalStorageDirectory()
//	                    .getAbsolutePath()
//	                    + File.separator
//	                    + File.separator
//	                    + "企业详细信息Log";
//
//	            File file = new File(logPath);
//	            if (!file.exists()) {
//	                file.mkdirs();
//	            }
//	            try {
//	                FileWriter fw = new FileWriter(logPath + File.separator
//	                        + "comapnylog.log", true);
//	                fw.write(str);
//	                fw.write("\n");
//	                fw.close();
//	            } catch (IOException e) {
//	                Log.e("Moreinfor", "load file failed...", e.getCause());
//	            }
//			}
			JSONObject fjson = JSONObject.parseObject(str);
			fjson.put("rlon", rlon);
			fjson.put("rlat", rlat);
			fjson.put("rcity", rcity);
			fjson.put("rprovince", rprovince);
			sendMoreftoservlet.sendPost(fjson.toString());
		}
		
       
		return str;

	}
}
