package com.hooper.hoshop.service.facade;

/**
 * Created by 47123 on 2016/5/23.
 */
public interface SmsService {

    public String sendSms(String mobile, String context);

    public String getRegisterTemplate(String code);

    public String getForgetPasswordTemplate(String code);

    public String getDeliveryTemplate(String orderId, String goodsName, String dCompany, String dNo);
}
