package com.hooper.hoshop.service.impl;

import com.hooper.hoshop.common.constant.AdminErrorConstant;
import com.hooper.hoshop.common.exception.BusinessException;
import com.hooper.hoshop.service.facade.QiniuService;
import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.File;

/**
 * Created by 47123 on 2016/5/15.
 */
@Service
public class QiniuServiceImpl implements QiniuService, InitializingBean {

    private final static Logger logger = Logger.getLogger(QiniuServiceImpl.class);

    @Value("${qiniu.ak}")
    String ACCESS_KEY;

    @Value("${qiniu.sk}")
    String SECRET_KEY;

    @Value("${qiniu.imgBucket_Name}")
    String Bucket_Name;

    @Value("${qiniu.domain}")
    private String qiuniuDomain;

    Auth auth;

    UploadManager uploadManager = new UploadManager();

    @Override
    public String upload(File file, String fileName) {
        try {
            //调用put方法上传
            Response res = uploadManager.put(file, fileName, getUpToken());
            //打印返回的信息
            logger.warn(res.bodyString());
            return res.bodyString();
        } catch (QiniuException e) {
            Response r = e.response;
            // 请求失败时打印的异常的信息
            logger.warn(r.toString());
            try {
                //响应的文本信息
                logger.warn(r.bodyString());
                throw new BusinessException(AdminErrorConstant.ADMIN_QINIU_UPLOAD_ERROR, r.toString() + " ;" + r.bodyString());
            } catch (QiniuException e1) {
                throw new BusinessException(AdminErrorConstant.ADMIN_QINIU_UPLOAD_ERROR, r.toString() + " ; no body");
            }
        }
    }

    public String getUpToken() {
        return auth.uploadToken(Bucket_Name);
    }

    public void setACCESS_KEY(String ACCESS_KEY) {
        this.ACCESS_KEY = ACCESS_KEY;
    }

    public void setBucket_Name(String bucket_Name) {
        Bucket_Name = bucket_Name;
    }

    public void setSECRET_KEY(String SECRET_KEY) {
        this.SECRET_KEY = SECRET_KEY;
    }

    public String getQiuniuDomain() {
        return qiuniuDomain;
    }

    public void setQiuniuDomain(String qiuniuDomain) {
        this.qiuniuDomain = qiuniuDomain;
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        if (!"".equals(ACCESS_KEY) && ACCESS_KEY != null
                && !"".equals(SECRET_KEY) && SECRET_KEY != null
                && !"".equals(Bucket_Name) && Bucket_Name != null) {
            auth = Auth.create(ACCESS_KEY, SECRET_KEY);
            logger.info("qiuniu init success :ak: " + ACCESS_KEY + " sk:" + SECRET_KEY + " bn:" + Bucket_Name);
        } else {
            logger.warn("qiniu ERROR :ak: " + ACCESS_KEY + " sk:" + SECRET_KEY + " bn:" + Bucket_Name);
        }
    }
}
