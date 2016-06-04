package com.hooper.hoshop.service.facade;

import com.hooper.hoshop.entity.*;

import java.util.List;

/**
 * Created by 47123 on 2016/5/28.
 */
public interface AddressService extends GenericService<Address, Integer> {

    List<Provinces> selectProvinces();

    List<Cities> selectByProvincesId(int provincesId);

    List<Areas> selectByCitiesId(int citiesId);

    Zipcode selectByAreaId(int areaId);

    Address selectDefaultAddress(int userId);

    List<Address> selectAddressesByUserId(int userId);

    void setDefaultAddress(int userId, int addressId);

    void changeDefaultAddress(int oldId, int newId);
}
