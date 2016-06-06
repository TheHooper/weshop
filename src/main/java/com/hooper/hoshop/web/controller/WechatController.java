package com.hooper.hoshop.web.controller;

import me.chanjar.weixin.mp.api.WxMpInMemoryConfigStorage;
import me.chanjar.weixin.mp.api.WxMpMessageRouter;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.api.WxMpServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by 47123 on 2016/6/7.
 */
@Controller
@RequestMapping("/wechat")
public class WechatController {

    WxMpInMemoryConfigStorage config;
    WxMpService wxMpService;
    WxMpMessageRouter wxMpMessageRouter;

    @PostConstruct
    public void initMpService() {
        config = new WxMpInMemoryConfigStorage();
        config.setAppId("wxd54b0096cd349d32"); // 设置微信公众号的appid
        config.setSecret("e9b4743203f743e287cf21da8dbd4fb3 "); // 设置微信公众号的app corpSecret
        config.setToken("hooperhooper"); // 设置微信公众号的token
        config.setAesKey("0y0TxC8fdQseeYGDatfb6LRe7CU64V4o86BSiPF5nAE"); // 设置微信公众号的EncodingAESKey

        wxMpService = new WxMpServiceImpl();
        wxMpService.setWxMpConfigStorage(config);
    }

    @RequestMapping(value = "/echo", method = {RequestMethod.GET}, produces = "application/json;charset=UTF-8")
    public void valid(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        // 微信加密签名
        String signature = request.getParameter("signature");
        // 时间戳
        String timestamp = request.getParameter("timestamp");
        // 随机数
        String nonce = request.getParameter("nonce");
        // 随机字符串
        String echostr = request.getParameter("echostr");

        PrintWriter out = response.getWriter();
        if (wxMpService.checkSignature(timestamp, nonce, signature)) {
            System.out.println("微信服务验证成功！");
            out.write(echostr);
            out.close();
        } else {
            out.write("非法请求");
        }
    }
}
