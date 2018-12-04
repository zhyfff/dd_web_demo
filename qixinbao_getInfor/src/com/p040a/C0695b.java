package com.p040a;


import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import com.MessageUtil;
import android.util.Base64;

public class C0695b {
	private static byte[] f1269a = C0694a.m1839a(MessageUtil.getKey());
    private static SecretKeySpec f1270b = new SecretKeySpec(f1269a, "AES");
    private static Cipher f1271c;

    static {
        f1271c = null;
        try {
            f1271c = Cipher.getInstance("AES/CBC/PKCS5Padding");
            f1271c.init(1, f1270b, new IvParameterSpec(C0694a.m1839a(MessageUtil.getIV())));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static String m1840a(String str) {
        try {
            if (f1271c == null) {
                f1271c = Cipher.getInstance("AES/CBC/PKCS5Padding");
                f1271c.init(1, f1270b, new IvParameterSpec(C0694a.m1839a(MessageUtil.getIV())));
            }
            byte[] bytes = str.getBytes("UTF-8");
            byte[] bArr = new byte[f1271c.getOutputSize(bytes.length)];
            f1271c.doFinal(bArr, f1271c.update(bytes, 0, bytes.length, bArr, 0));
            return Base64.encodeToString(bArr, 2);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static String m1841b(String str) {
        try {
            Cipher instance = Cipher.getInstance("AES/CBC/PKCS5Padding");
            instance.init(2, new SecretKeySpec(C0694a.m1839a(MessageUtil.getDECKey()), "AES"), new IvParameterSpec(C0694a.m1839a(MessageUtil.getIV())));
            return new String(instance.doFinal(Base64.decode(str, 2)), "UTF-8");
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }


}
