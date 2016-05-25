package com.hooper.hoshop.admin.controller;

import com.alibaba.druid.support.json.JSONUtils;
import com.hooper.hoshop.dto.output.JsonOutput;
import com.hooper.hoshop.entity.Attribute;
import com.hooper.hoshop.service.facade.AttributeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 47123 on 2016/5/16.
 */
@Controller
@RequestMapping("/admin/attr")
public class AttributeController {

    @Resource
    AttributeService attributeService;

    @RequestMapping(value = "/parents", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public List<Attribute> getParents() {
        List<Attribute> attributes = attributeService.selectParents();
        return attributes;
    }

    @RequestMapping(value = "/children/{parentId}", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public List<Attribute> getParents(@PathVariable int parentId) {
        List<Attribute> attributes = attributeService.selectChildren(parentId);
        return attributes;
    }

    @RequestMapping(value = "/insert/parent", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public JsonOutput addParent(Attribute attribute) {
        attributeService.insertParent(attribute);
        JsonOutput output = new JsonOutput();
        return output;
    }

    @RequestMapping(value = "/insert/child", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public JsonOutput addChild(Attribute attribute, int parentId, String attributeName) {
        System.out.println(parentId);
        System.out.println(attributeName);
        System.out.println(attribute.getParentId());
        attributeService.insertChild(attribute);
        JsonOutput output = new JsonOutput();
        return output;
    }
}
