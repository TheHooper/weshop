package com.hooper.hoshop.web.controller;

import me.chanjar.weixin.common.bean.WxMenu;
import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpInMemoryConfigStorage;
import me.chanjar.weixin.mp.api.WxMpMessageRouter;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.api.WxMpServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 47123 on 2016/6/7.
 */
@Controller
@RequestMapping("/wechat")
public class WechatController {

    private static Logger log = LoggerFactory.getLogger(WechatController.class);

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

    @RequestMapping(value = "/create/menu", method = {RequestMethod.GET, RequestMethod.POST}, produces = "application/json;charset=UTF-8")
    public void createMenu() {
        WxMenu wxMenu = new WxMenu();
        List<WxMenu.WxMenuButton> buttons = new ArrayList<WxMenu.WxMenuButton>();
        //tab菜单按钮生成
        WxMenu.WxMenuButton softServiceButton = new WxMenu.WxMenuButton();
        softServiceButton.setName("Hooper");
        softServiceButton.setType("click");
        softServiceButton.setUrl("");
        softServiceButton.setKey("");
        List<WxMenu.WxMenuButton> softServiceSubButtons = new ArrayList<WxMenu.WxMenuButton>();
        WxMenu.WxMenuButton businessBookButton = new WxMenu.WxMenuButton();
        businessBookButton.setName("Hooper AND W");
        businessBookButton.setType("view");
        businessBookButton.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxc409abdf7a9e1707&redirect_uri=http%3A%2F%2Fwww.shenma063.cn%2Fecshop-web%2Fuser%2Fwechat%2Flogin&response_type=code&scope=snsapi_base#wechat_redirect");
        businessBookButton.setKey("cloth shop");

      /*  WxMenuButton businessQueryButton = new WxMenuButton();
        businessQueryButton.setName("X微商城");
        businessQueryButton.setType("view");
        businessQueryButton.setUrl("http://www.baidu.com");
        businessQueryButton.setKey("seafood shop");*/

        softServiceSubButtons.add(businessBookButton);
     /*   softServiceSubButtons.add(businessQueryButton);*/
        softServiceButton.setSubButtons(softServiceSubButtons);


        WxMenu.WxMenuButton shopButton = new WxMenu.WxMenuButton();
        shopButton.setName("微商城");
        shopButton.setType("view");
        shopButton.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxd54b0096cd349d32&redirect_uri=http%3A%2F%2Fwww.shenma063.cn%2Fuser%2Fwregister&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect");
        shopButton.setKey("Homall shop");

        buttons.add(softServiceButton);
        buttons.add(shopButton);
        wxMenu.setButtons(buttons);
        try {
            wxMpService.menuCreate(wxMenu);
            log.info("微信菜单创建成功！");
        } catch (WxErrorException e) {
            log.error("微信菜单创建失败！" + e.getMessage());
        }
    }

}
