package com.bertadata.qxb.api;

public class QXBApi {
	
	private static final int API_ACTIVITY = 35;
    private static final int API_ADDGROUP = 26;
    private static final int API_APPINFO = 31;
    private static final int API_ARTICLES = 5;
    private static final int API_CLAIMENTERPRISE = 41;
    private static final int API_COMMENS = 10;
    private static final int API_COMMENS_MY = 38;
    private static final int API_COMMENT = 39;
    private static final int API_COMMENT_ADD = 12;
    private static final int API_COMMENT_LIKE = 13;
    private static final int API_COMMENT_REPLY = 14;
    private static final int API_COMMENT_REPLY_ALL = 16;
    private static final int API_COMMENT_REPORT = 15;
    private static final int API_COMPANY_MONITOR = 24;
    private static final int API_COMPANY_TAGS = 11;
    private static final int API_CREATEVIPORDER = 21;
    private static final int API_DELETEGROUP = 28;
    private static final int API_DISHONESTY = 50;
    private static final int API_ENTERPRISE = 0;
    private static final int API_ENTERPRISE390 = 51;
    private static final int API_EXECUTION = 2;
    private static final int API_FUNCINFO = 45;
    private static final int API_GENERAL = 3;
    private static final int API_GETFOCUSON_ALLLIST = 19;
    private static final int API_GETFOCUSVERSION = 23;
    private static final int API_GETSTARTIMG = 18;
    private static final int API_GETVIPCOMBO = 20;
    private static final int API_GROUPLIST = 25;
    private static final int API_INCREASE = 44;
    private static final int API_INTEGRAL_ALL = 17;
    private static final int API_INVOICE = 37;
    private static final int API_LAWSUIT = 1;
    private static final int API_MAIL_LIST = 46;
    private static final int API_MEMOS = 47;
    private static final int API_MESSAGE = 40;
    private static final int API_MONITOR = 43;
    private static final int API_MOVEGROUPS = 30;
    private static final int API_PAY = 8;
    private static final int API_PRODUCT = 33;
    private static final int API_RANK = 6;
    private static final int API_RANKING = 49;
    private static final int API_REBATE = 36;
    private static final int API_RELATION = 34;
    private static final int API_SHARE = 48;
    private static final int API_SMS = 9;
    private static final int API_USER = 4;
    private static final int API_USER_BEHAVIOR = 53;
    private static final int API_USER_COLLECT = 42;
    private static final int API_USER_CONFIG = 52;
    private static final int API_USER_ORDER = 7;
    private static final int API_VIP = 32;
    public static boolean CAN_REQUEST = true;
    public static final int DEFAULT_TIMEOUT = 12000;
    public static final String ENCRYPTION_KEY = "4B58F6B4A4314415B6AFCAD47A66FB37";
    public static final String GT_BASE_URL = "http://static.geetest.com/static/appweb/app-index.html";
    public static final String HTTP_HEADER_ACCOUNT = "account";
    public static final String HTTP_HEADER_APP_VERSION = "app-version";
    public static final String HTTP_HEADER_DEVICEID = "device-id";
    public static final String HTTP_HEADER_FUNCTION_SETTINGS_TIMES = "functionsettings-time";
    public static final String HTTP_HEADER_NICK_NAME = "nick-name";
    public static final String HTTP_HEADER_PLATFORM = "platform";
    public static final String HTTP_HEADER_PUSH_REGISTRATION = "push-registration";
    public static final String HTTP_HEADER_SESSIONID = "session-id";
    public static final String HTTP_HEADER_SYS_SETTINGS_TIMES = "syssettings-time";
    public static final String HTTP_HEADER_USERID = "user-id";
    public static final String PLATFORM = "android";
    private static String QXB_FOLDER = "/v4";
    public static String QXB_FOLDER_APPB = "/appb";
    private static final String QXB_FOLDER_APPINFO = "/appInfo";
    private static final String QXB_FOLDER_COMMON = "/comment";
    private static final String QXB_FOLDER_INTEGRAL = "/integral";
    private static final String QXB_FOLDER_RELATION = "/relation";
    public static String QXB_FOLDER_V4 = "/v4";
    private static final String QXB_FOLDER_VIP = "/vip";
    public static final String RELEASE_URL = "https://apps.qixin.com";
    private static final String SIT_URL = "http://sitapp.qixin007.com";
    public static final String TOKEN = "token";
    private static final String UAT_URL = "http://uatapp.qixin007.com";

    public static String getQXB_FOLDER() {
        return QXB_FOLDER;
    }

}
