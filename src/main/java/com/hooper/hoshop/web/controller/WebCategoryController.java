package com.hooper.hoshop.web.controller;

import com.hooper.hoshop.admin.form.DataTablePageForm;
import com.hooper.hoshop.common.constant.AdminConstants;
import com.hooper.hoshop.common.util.DateUtil;
import com.hooper.hoshop.dto.Category.CategoryDto;
import com.hooper.hoshop.dto.output.Category.DataTablePageOutput;
import com.hooper.hoshop.entity.Category;
import com.hooper.hoshop.service.facade.CategoryService;
import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by 47123 on 2016/5/23.
 */
@Controller
@RequestMapping("/cat")
public class WebCategoryController {

    private final static Logger logger = Logger.getLogger(WebCategoryController.class);

    @Resource
    CategoryService categoryService;

    @RequestMapping(value = "/roots", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public List<Category> getRoots() {
        List<Category> categories = categoryService.getRootCategories();
        return categories;
    }

    @RequestMapping(value = "/cats", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public List<Category> getCatsNoPage(int parentId) {
        List<Category> categories = categoryService.getCategoriesByParentId(parentId);
        return categories;
    }
}
