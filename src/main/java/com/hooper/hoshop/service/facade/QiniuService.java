package com.hooper.hoshop.service.facade;

import java.io.File;

/**
 * Created by 47123 on 2016/5/15.
 */
public interface QiniuService {

    public String getUpToken();

    public String upload(File file, String fileName);

    public String getQiuniuDomain();
}
