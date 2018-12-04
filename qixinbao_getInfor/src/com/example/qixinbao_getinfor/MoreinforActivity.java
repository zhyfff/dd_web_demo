package com.example.qixinbao_getinfor;

import com.example.qixinbao_getinfo.R;

import android.app.Activity;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MoreinforActivity extends Activity {

	
	static Button but1 = null;
	static TextView textv = null;
	static EditText edit = null;
	private final MyHandler handler = new MyHandler();
	
	private static class MyHandler extends Handler{

		@Override
		public void handleMessage(Message message) {
			 super.handleMessage(message);
			
			switch (message.what) {
			case 1:
				String str = (String) message.obj;
				textv.setText(str);
				break;

			default:
				break;
			}
		}
		
		
		
	}
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_moreinfor);
		
		Button but1 = (Button) findViewById(R.id.but1);
		textv = (TextView) findViewById(R.id.text1);
		edit = (EditText) findViewById(R.id.edit);
		but1.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {

				new Thread(new Runnable() {
					
					@Override
					public void run() {
						Log.i("qxb", "ªÒ»°");	
						String str = Moreinfor.getDta(edit.getText().toString(),"","","","");
						Message message = Message.obtain();
						message.what = 1;
						message.obj = str;
						handler.sendMessage(message);
					}
				}).start();
			}
		});
	}
}
