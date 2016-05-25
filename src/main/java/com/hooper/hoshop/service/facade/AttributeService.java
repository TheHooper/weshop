package com.hooper.hoshop.service.facade;

import com.hooper.hoshop.entity.Attribute;

import java.util.List;

/**
 * Created by 47123 on 2016/5/16.
 */
public interface AttributeService extends GenericService<Attribute, Integer> {

    public List<Attribute> selectParents();

    public List<Attribute> selectChildren(int parentId);

    public void insertParent(Attribute attribute);

    public void insertChild(Attribute attribute);
}
