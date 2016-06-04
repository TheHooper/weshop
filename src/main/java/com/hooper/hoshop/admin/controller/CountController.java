package com.hooper.hoshop.admin.controller;

import com.hooper.hoshop.service.facade.CountService;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

/**
 * Created by 47123 on 2016/6/2.
 */
@Controller
public class CountController {

    @Resource
    CountService countService;
}
