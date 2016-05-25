package com.hooper.hoshop.service.impl;

import com.hooper.hoshop.common.constant.WebErrorConstant;
import com.hooper.hoshop.common.exception.BusinessException;
import com.hooper.hoshop.service.facade.SmsService;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Created by 47123 on 2016/5/23.
 */
@Service
public class DuanXinBaoSmsService implements SmsService, InitializingBean {

    @Value("${duanxinbao.ac}")
    private String account;

    @Value("${duanxinbao.pw}")
    private String password;

    @Value("${duanxinbao.url}")
    private String url;

    public void setAccount(String account) {
        this.account = account;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setUrl(String url) {
        this.url = url;
    }


    public String getRegisterTemplate(String code) {
        return "【homall】您的验证码是" + code;
    }

    public String getForgetPasswordTemplate(String code) {
        return "【homall】您正在找回密码，您的验证码是" + code + ",打死都不要告诉别人哟";
    }

    public String getDeliveryTemplate(String orderId, String goodsName, String dCompany, String dNo) {
        if (goodsName.length() > 10) {
            goodsName = goodsName.substring(0, 10);
        }
        return "【homall】感谢您使用homall商城购物，您的订单" + orderId + "，购买的" + goodsName + "已发货，由物流公司" + dCompany + "承运,物流号" + dNo;
    }

    @Override
    public String sendSms(String mobile, String context) {
        StringBuffer httpArg = new StringBuffer();
        httpArg.append("u=").append(account).append("&");
        httpArg.append("p=").append(md5(password)).append("&");
        httpArg.append("m=").append(mobile).append("&");
        httpArg.append("c=").append(encodeUrlString(context, "UTF-8"));

        String result = request(url, httpArg.toString());
        if (!"0".equals(result)) {
            throw new BusinessException(WebErrorConstant.SMS_SEND_ERROR, "短信发送失败 sms send failed: code = " + result);
        }
        return result;
    }

    public static String request(String httpUrl, String httpArg) {
        BufferedReader reader = null;
        String result = null;
        StringBuffer sbf = new StringBuffer();
        httpUrl = httpUrl + "?" + httpArg;

        try {
            URL url = new URL(httpUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.connect();
            InputStream is = connection.getInputStream();
            reader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
            String strRead = reader.readLine();
            if (strRead != null) {
                sbf.append(strRead);
                while ((strRead = reader.readLine()) != null) {
                    sbf.append("\n");
                    sbf.append(strRead);
                }
            }
            reader.close();
            result = sbf.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public static String md5(String plainText) {
        StringBuffer buf = null;
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(plainText.getBytes());
            byte b[] = md.digest();
            int i;
            buf = new StringBuffer("");
            for (int offset = 0; offset < b.length; offset++) {
                i = b[offset];
                if (i < 0)
                    i += 256;
                if (i < 16)
                    buf.append("0");
                buf.append(Integer.toHexString(i));
            }
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return buf.toString();
    }

    public static String encodeUrlString(String str, String charset) {
        String strret = null;
        if (str == null)
            return str;
        try {
            strret = java.net.URLEncoder.encode(str, charset);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return strret;
    }

    public static void main(String[] args) {

        String testUsername = "mikeghgh"; //在短信宝注册的用户名
        String testPassword = "woaini1314"; //在短信宝注册的密码
        String testPhone = "13923809633";
        String testContent = "【homall】感谢您使用homall商城购物，您的订单7611231955，购买的谜姬男用自慰器充电震动免提飞机杯已发货，由物流公司中通快递承运,物流号402603648245"; // 注意测试时，也请带上公司简称或网站签名，发送正规内容短信。千万不要发送无意义的内容：例如 测一下、您好。否则可能会收不到

        String httpUrl = "http://api.smsbao.com/sms";

        StringBuffer httpArg = new StringBuffer();
        httpArg.append("u=").append(testUsername).append("&");
        httpArg.append("p=").append(md5(testPassword)).append("&");
        httpArg.append("m=").append(testPhone).append("&");
        httpArg.append("c=").append(encodeUrlString(testContent, "UTF-8"));

        String result = request(httpUrl, httpArg.toString());
        System.out.println(result);
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        System.out.println(" ac : " + this.account + " pw :" + this.password + " url: " + this.url);
    }
}
