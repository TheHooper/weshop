package com.hooper.hoshop.web.controller;

import com.hooper.hoshop.common.aspect.annotation.UserLoginAnnotation;
import com.hooper.hoshop.common.constant.WebConstant;
import com.hooper.hoshop.dto.output.JsonOutput;
import com.hooper.hoshop.entity.*;
import com.hooper.hoshop.service.facade.AddressService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by 47123 on 2016/5/31.
 */
@Controller
@RequestMapping("/address")
public class AddressController {

    @Resource
    AddressService addressService;

    @RequestMapping(value = "/provinces", method = {RequestMethod.GET, RequestMethod.POST})
    public
    @ResponseBody
    List<Provinces> getProvinces() {
        return addressService.selectProvinces();
    }

    @RequestMapping(value = "/cities/{provinceId}", method = {RequestMethod.GET, RequestMethod.POST})
    public
    @ResponseBody
    List<Cities> getCities(@PathVariable int provinceId) {
        return addressService.selectByProvincesId(provinceId);
    }

    @RequestMapping(value = "/areas/{cityId}", method = {RequestMethod.GET, RequestMethod.POST})
    public
    @ResponseBody
    List<Areas> geAreas(@PathVariable int cityId) {
        return addressService.selectByCitiesId(cityId);
    }

    @UserLoginAnnotation
    @RequestMapping(value = "/addresses", method = {RequestMethod.GET, RequestMethod.POST})
    public
    @ResponseBody
    List<Address> getAddresses(HttpSession session) {
        User user = (User) session.getAttribute(WebConstant.SESSION_SIGNIN_USER);
        return addressService.selectAddressesByUserId(user.getId());
    }

    @UserLoginAnnotation
    @RequestMapping(value = "/default", method = {RequestMethod.GET, RequestMethod.POST})
    public
    @ResponseBody
    Address getDefaultAddress(HttpSession session) {
        User user = (User) session.getAttribute(WebConstant.SESSION_SIGNIN_USER);
        return addressService.selectDefaultAddress(user.getId());
    }

    @UserLoginAnnotation
    @RequestMapping(value = "/setDefault", method = {RequestMethod.GET, RequestMethod.POST})
    public
    @ResponseBody
    JsonOutput setDefaultAddress(Integer addressId, HttpSession session) {
        User user = (User) session.getAttribute(WebConstant.SESSION_SIGNIN_USER);
        addressService.setDefaultAddress(user.getId(), addressId);
        JsonOutput output = new JsonOutput();
        return output;
    }

    @UserLoginAnnotation
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public
    @ResponseBody
    JsonOutput add(Address address, HttpSession session) {
        User user = (User) session.getAttribute(WebConstant.SESSION_SIGNIN_USER);
        address.setUserId(user.getId());
        addressService.insert(address);
        JsonOutput output = new JsonOutput();
        return output;
    }

    @UserLoginAnnotation
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public
    @ResponseBody
    JsonOutput update(Address address, HttpSession session) {
        User user = (User) session.getAttribute(WebConstant.SESSION_SIGNIN_USER);
        address.setUserId(user.getId());
        addressService.update(address);
        JsonOutput output = new JsonOutput();
        return output;
    }

    @UserLoginAnnotation
    @RequestMapping(value = "/del", method = RequestMethod.POST)
    public
    @ResponseBody
    JsonOutput del(Integer addressId, HttpSession session) {
        User user = (User) session.getAttribute(WebConstant.SESSION_SIGNIN_USER);
        addressService.delete(addressId);
        JsonOutput output = new JsonOutput();
        return output;
    }

}
