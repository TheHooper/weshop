package com.hooper.hoshop.admin.controller;

import com.hooper.hoshop.admin.form.DataTablePageForm;
import com.hooper.hoshop.common.constant.AdminConstants;
import com.hooper.hoshop.common.constant.AdminErrorConstant;
import com.hooper.hoshop.common.exception.BusinessException;
import com.hooper.hoshop.common.util.DateUtil;
import com.hooper.hoshop.dto.Category.CategoryDto;
import com.hooper.hoshop.dto.output.BootstrapPageOutput;
import com.hooper.hoshop.dto.output.Category.DataTablePageOutput;
import com.hooper.hoshop.dto.output.JsonOutput;
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
 * Created by 47123 on 2016/5/13.
 */
@Controller
@RequestMapping("/admin/cat")
public class CategoryController {

    private final static Logger logger = Logger.getLogger(CategoryController.class);

    @Resource
    CategoryService categoryService;

    @RequestMapping("/list")
    public String cats() {
        return "admin/cats/cats";
    }

    @RequestMapping(value = "/addParent", method = {RequestMethod.POST})
    @ResponseBody
    public JsonOutput addParent(Category category) {
        if (category.getTypeName() != null && !"".equals(category.getTypeName())) {
            category.setParentId(0);
            categoryService.insert(category);
            JsonOutput output = new JsonOutput();
            return output;
        } else {
            throw new BusinessException(AdminErrorConstant.ADMIN_PARAM_NULL, "param null error");
        }
    }

    @RequestMapping(value = "/add", method = {RequestMethod.POST})
    @ResponseBody
    public JsonOutput add(Category category) {
        if (category.getTypeName() != null && !"".equals(category.getTypeName())) {
            categoryService.insert(category);
            JsonOutput output = new JsonOutput();
            return output;
        } else {
            throw new BusinessException(AdminErrorConstant.ADMIN_PARAM_NULL, "param null error");
        }
    }

    @RequestMapping(value = "/update", method = {RequestMethod.POST})
    @ResponseBody
    public JsonOutput update(Category category) {
        if (category.getTypeName() != null && !"".equals(category.getTypeName())) {
            categoryService.update(category);
            JsonOutput output = new JsonOutput();
            return output;
        } else {
            throw new BusinessException(AdminErrorConstant.ADMIN_PARAM_NULL, "param null error");
        }
    }

    @RequestMapping(value = "/del", method = {RequestMethod.POST})
    @ResponseBody
    public JsonOutput del(Integer id) {
        if (id != null) {
            categoryService.delete(id);
            JsonOutput output = new JsonOutput();
            return output;
        } else {
            throw new BusinessException(AdminErrorConstant.ADMIN_PARAM_NULL, "param null error");
        }
    }

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

    @RequestMapping(value = "/cats/{parentId}", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public DataTablePageOutput getCats(@PathVariable int parentId, DataTablePageForm pageForm, HttpServletRequest request) {
        int offset = pageForm.getStart() == null ? 0 : pageForm.getStart();
        int limit = pageForm.getLength() == null ? 10 : pageForm.getLength();
        List<Category> categories = categoryService.getCategoriesByParentId(parentId, offset, limit);
        List<CategoryDto> dtos = new ArrayList<CategoryDto>();
        for (Category cat : categories) {
            CategoryDto dto = new CategoryDto();
            BeanUtils.copyProperties(cat, dto);
            if (cat.getcTime() != null) {
                dto.setcTime(DateUtil.getFormatDate(new Date(cat.getcTime()), AdminConstants.ADMIN_TABLE_TIME_FORMATTER));
            }
            if (cat.getuTime() != null) {
                dto.setuTime(DateUtil.getFormatDate(new Date(cat.getuTime()), AdminConstants.ADMIN_TABLE_TIME_FORMATTER));
            }
            dtos.add(dto);
        }
        DataTablePageOutput output = new DataTablePageOutput();
        int total = categoryService.countCategoriesByParentId(parentId);

        output.setData(dtos);
        output.setRecordsTotal(total);
        output.setRecordsFiltered(total);
        return output;
    }
}
