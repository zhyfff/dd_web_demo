package com.example.qixinbao_getinfor;

import com.logcatch.MyCrashHandler;

import android.app.Application;

public class MyApplication extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        //�򿪴�����־�����浽sd��
        MyCrashHandler myCrashHandler = MyCrashHandler.getInstance();
        myCrashHandler.init(getApplicationContext());

    }
}
