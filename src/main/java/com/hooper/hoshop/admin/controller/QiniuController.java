package com.hooper.hoshop.admin.controller;

import com.alibaba.druid.support.json.JSONUtils;
import com.alibaba.fastjson.JSON;
import com.hooper.hoshop.common.util.DateUtil;
import com.hooper.hoshop.dto.output.Qiniu.QiniuResponse;
import com.hooper.hoshop.service.facade.QiniuService;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by 47123 on 2016/5/15.
 */
@Controller
@RequestMapping("/admin/qiniu")
public class QiniuController {

    private final static Logger logger = Logger.getLogger(QiniuController.class);

    @Resource
    QiniuService qiniuService;

    @RequestMapping(value = "/uptoken", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    public
    @ResponseBody
    String uploadToken() {
        String uptoken = qiniuService.getUpToken();
        Map map = new HashMap();
        map.put("uptoken", uptoken);
        return JSONUtils.toJSONString(map);
    }

    @RequestMapping(value = "/upload/ckeditor", method = {RequestMethod.POST, RequestMethod.GET})
    public void uplodaImg(@RequestParam("upload") MultipartFile file,//
                          HttpServletRequest request, //
                          HttpServletResponse response)//
    {
        try {

            PrintWriter out = response.getWriter();
            String CKEditorFuncNum = request.getParameter("CKEditorFuncNum");
            String fileName = file.getOriginalFilename();
            String uploadContentType = file.getContentType();
            String expandedName = "";
            if (uploadContentType.equals("image/pjpeg")
                    || uploadContentType.equals("image/jpeg")) {
                // IE6上传jpg图片的headimageContentType是image/pjpeg，而IE9以及火狐上传的jpg图片是image/jpeg
                expandedName = ".jpg";
            } else if (uploadContentType.equals("image/png")
                    || uploadContentType.equals("image/x-png")) {
                // IE6上传的png图片的headimageContentType是"image/x-png"
                expandedName = ".png";
            } else if (uploadContentType.equals("image/gif")) {
                expandedName = ".gif";
            } else if (uploadContentType.equals("image/bmp")) {
                expandedName = ".bmp";
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("window.parent.CKEDITOR.tools.callFunction("
                        + CKEditorFuncNum + ",'',"
                        + "'文件格式不正确（必须为.jpg/.gif/.bmp/.png文件）');");
                out.println("</script>");
                return;
            }
            if (file.getSize() > 1024 * 1024 * 3) {
                out.println("<script type=\"text/javascript\">");
                out.println("window.parent.CKEDITOR.tools.callFunction("
                        + CKEditorFuncNum + ",''," + "'文件大小不得大于3M');");
                out.println("</script>");
                return;
            }
            fileName = DateUtil.getFormatDate(new Date(), "yyyyMMddHHmmss") + expandedName;

            //转换MulitPartFile为File
            CommonsMultipartFile cf = (CommonsMultipartFile) file;
            DiskFileItem fi = (DiskFileItem) cf.getFileItem();
            File f = fi.getStoreLocation();


            String url = qiniuService.upload(f, fileName);
            QiniuResponse qiuniuResult = JSON.parseObject(url, QiniuResponse.class);

            out.println("<script type=\"text/javascript\">");
            out.println("window.parent.CKEDITOR.tools.callFunction("
                    + CKEditorFuncNum + ",'" + qiniuService.getQiuniuDomain() + qiuniuResult.getKey()
                    + "','')");
            out.println("</script>");
            return;
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
