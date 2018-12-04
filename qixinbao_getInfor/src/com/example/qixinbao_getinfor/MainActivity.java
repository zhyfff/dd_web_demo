package com.example.qixinbao_getinfor;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import com.bertadata.qxb.api.Myconfig;
import com.example.qixinbao_getinfo.R;
import com.qixinbao.download.information;
import com.qixinbao.network.getLocationInfo;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends Activity {

	Button button = null;
	static TextView textv = null;
	static TextView textTime = null;
	static TextView textpage = null;
	Button buttmore = null;
	private final MyHandler handler = new MyHandler();
	static final int REPONSE_IN = 0;
	static final int TIME_RE = 1;
	static final int REPAGE = 2;
	static boolean flag = true;
	final static String url="http://"+Myconfig.getHost()+"/locatpoint/sevlet/UpdateLocalServlet";


	private static class MyHandler extends Handler {
		@Override
	    public void handleMessage(Message msg) {
	        super.handleMessage(msg);
	        switch (msg.what) {    //获取消息，更新UI
	            case REPONSE_IN:
	            	String reponsed = (String) msg.obj;
					textv.setText(reponsed);
					break;
	            case TIME_RE:
	            	String time = (String) msg.obj;
	            	textTime.setText(time);
	            	break;
	            case REPAGE:
	            	String page = (String) msg.obj;
	            	textpage.setText(page);
	            	break;
				default:
					break;
	        }
	    }
	}

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		button = (Button) findViewById(R.id.but1);
		textv = (TextView) findViewById(R.id.text1);
		textTime = (TextView) findViewById(R.id.text_time);
		textpage = (TextView) findViewById(R.id.page);
		buttmore = (Button) findViewById(R.id.but2);
		button.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				
				if (flag) {
					 flag = false;
					 button.setText("正在运行");
					 new Thread(new Runnable() {
							
							@Override
							public void run() {
								
								String time = now();
								Message mt = Message.obtain();
								mt.what = TIME_RE;
								mt.obj = "--开始时间："+time+"---";
								handler.sendMessage(mt);
								
								while (!flag) {
									
									if (flag) {
										break;
									}
//									String xmlData= getLocationInfo.getLocalpoint(url);
//							        Log.d("xmldata",xmlData);
//							        Map<String ,String> p = getLocationInfo.parseXmlWithPull(xmlData);
//							        String longitude = p.get("lng");
//							        String latitude = p.get("lat");
//							        String city = p.get("city");
//							        String province = p.get("province");
							        String longitude = "121.244178";
							        String latitude = "30.102144";
							        String city = "";
							        String province = "";
							        
							        
									for (int i = 0; i < 150; i++) {
										Message mp = new Message();
										mp.what = REPAGE;
										mp.obj = "——第"+i*40+"条开始——";
										handler.sendMessage(mp);
										
										Message message = Message.obtain();
										message.what = REPONSE_IN;
										String str = runProject.Startrun(i*40,url,longitude,latitude,city,province);
										MainActivity.sleep(3);
										message.obj = longitude+"---"+latitude+"\n"+city+"---"+province;
										handler.sendMessage(message);
										if (!str.equals("")) {
											if (information.ifhasNext(str)==false) {
												Log.i("qxb", "没有更多了！！");
												break;
											}
										}
										
									}	
								}
								
							}
						}).start();
				     onStop();
				}else {
					 flag =true;
					 button.setText("点击开始"); 
					 onStart();
				}
				
				
				
			}
		});
		
		buttmore.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				Intent intent = new Intent(getApplicationContext(),MoreinforActivity.class);
				startActivity(intent);
				
			}
		});
		
	}


	public static void sleep(int time) {
		try {
			Thread.sleep(1000 * time);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static String now() {
		SimpleDateFormat formatter_f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date currentTime_f = new java.util.Date();
		String new_date_f = formatter_f.format(currentTime_f);
		return new_date_f;
	}

}
