package com.example.qixinbao_getinfor;

import com.logcatch.MyCrashHandler;

import android.app.Application;

public class MyApplication extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        //打开错误日志，保存到sd卡
        MyCrashHandler myCrashHandler = MyCrashHandler.getInstance();
        myCrashHandler.init(getApplicationContext());

    }
}
