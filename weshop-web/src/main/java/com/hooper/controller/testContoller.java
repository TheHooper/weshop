package com.hooper.controller;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by 47123 on 2016/3/14.
 */
@Controller
@EnableAutoConfiguration
public class testContoller {

    @RequestMapping("/hellow/{name}")
    @ResponseBody
    String home(@PathVariable String name) {
        return "Hello " + name + "!";
    }

}
