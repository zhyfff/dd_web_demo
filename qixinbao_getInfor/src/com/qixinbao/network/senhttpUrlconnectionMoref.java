package com.qixinbao.network;

import java.io.InputStream;
import java.io.OutputStream;
import java.net.ConnectException;
import java.net.HttpURLConnection;
import java.net.SocketException;
import java.net.SocketTimeoutException;
import java.net.URL;
import java.net.UnknownHostException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.HashMap;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLHandshakeException;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import org.apache.http.conn.ConnectTimeoutException;

import com.qixinbao.network.utils.httpUtil;
import com.qixinbao.rcode.rc;

import android.util.Log;

public class senhttpUrlconnectionMoref {

	public static String getMoref(String cid) {
		HashMap<String, Object> hashMap = new HashMap<>();
		hashMap.put("id", cid);
		
		
		HttpURLConnection connection = null;
		String requestHeader = null;//����ͷ
		byte[] requestBody = null;//������
		String responseHeader = null;//��Ӧͷ
        byte[] responseBody = null;//��Ӧ��
        SSLSocketFactory oldSocketFactory = null;
        HostnameVerifier oldHostnameVerifier = null;
        String ss ="";
		try {
			String str= "https://apps.qixin.com/v4/enterprise/getSummary2";
			URL url =  new URL(str);
			connection = (HttpURLConnection) url.openConnection();
			boolean useHttps = str.startsWith("https");
	        if (useHttps) {
	            HttpsURLConnection https = (HttpsURLConnection) connection;
	            oldSocketFactory = trustAllHosts(https);
	            oldHostnameVerifier = https.getHostnameVerifier();
	            https.setHostnameVerifier(DO_NOT_VERIFY);
	        }
			connection.setRequestMethod("POST");
			connection.setDoInput(true);
			connection.setConnectTimeout(8000);
			connection.setReadTimeout(8000);
			connection.setRequestProperty("platform", "android");
			connection.setRequestProperty("device-id", "SN-4d0006d6c44a7100");
			connection.setRequestProperty("push-registration", "WSM1KVFDayFCVBY20Pb4H7SU");
			connection.setRequestProperty("syssettings-time", "1521002002");
			connection.setRequestProperty("functionsettings-time", "1520409741");
			connection.setRequestProperty("user-id", "5a9f6ca3ba16f90b7725ec1d");
			connection.setRequestProperty("session-id", "aba68221-179b-4a28-a132-c5af6a653a27");
			connection.setRequestProperty("account", "13263168475");
			connection.setRequestProperty("app-version", "4.2.2");
			connection.setRequestProperty("token", rc.gettoken(hashMap,str).get("headtoken"));
			connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
			connection.setRequestProperty("User-Agent", "Dalvik/1.6.0 (Linux; U; Android 4.4.2; SM-G3568V Build/KOT49H)");
			connection.setRequestProperty("Host", "apps.qixin.com");
			connection.setRequestProperty("Connection", "Keep-Alive");
			connection.setRequestProperty("Accept-Encoding", "gzip");
			requestHeader = httpUtil.getReqeustHeader(connection);
			OutputStream os = connection.getOutputStream();
			requestBody = new String("id="+cid+"&token="+rc.gettoken(hashMap,str).get("bodytoken")).getBytes("UTF-8");
			os.write(requestBody);
			os.flush();
			os.close();
			InputStream is = connection.getInputStream();
			responseBody = httpUtil.getBytesByInputStream(is);
			responseHeader = httpUtil.getResponseHeader(connection);
			ss = new String(responseBody,"utf-8");  
			
			
//			Log.i("qxb", ss);

		} catch (ConnectTimeoutException e) {
			getMoref(cid);
		} catch (ConnectException e) {
			getMoref(cid);
		} catch (UnknownHostException e) {
			getMoref(cid);
		} catch (SocketTimeoutException e) {
			getMoref(cid);
		} catch (SocketException e) {
			getMoref(cid);
		} catch (StackOverflowError e) {
			getMoref(cid);
		} catch (SSLHandshakeException e) {
			getMoref(cid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Log.i("qxb", "Exception:" + e);
		}finally {
			if (connection!=null) {
				connection.disconnect();
			}
		}
		return ss;
		
	}
	
	/**
     * ����javaĬ�ϵ�֤����֤
     */
    private static final TrustManager[] trustAllCerts = new TrustManager[]{new X509TrustManager() {
        public java.security.cert.X509Certificate[] getAcceptedIssuers() {
            return new java.security.cert.X509Certificate[]{};
        }

        public void checkClientTrusted(X509Certificate[] chain, String authType)
                throws CertificateException {
        }

        public void checkServerTrusted(X509Certificate[] chain, String authType)
                throws CertificateException {
        }
    }};
    
    
    /**
     * ���ò���֤����
     */
    private static final HostnameVerifier DO_NOT_VERIFY = new HostnameVerifier() {
        public boolean verify(String hostname, SSLSession session) {
            return true;
        }
    };

    /**
     * ��������
     * @param connection
     * @return
     */
    private static SSLSocketFactory trustAllHosts(HttpsURLConnection connection) {
        SSLSocketFactory oldFactory = connection.getSSLSocketFactory();
        try {
            SSLContext sc = SSLContext.getInstance("TLS");
            sc.init(null, trustAllCerts, new java.security.SecureRandom());
            SSLSocketFactory newFactory = sc.getSocketFactory();
            connection.setSSLSocketFactory(newFactory);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return oldFactory;
    }
}