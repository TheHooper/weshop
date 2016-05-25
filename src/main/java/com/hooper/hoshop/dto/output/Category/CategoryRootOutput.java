package com.hooper.hoshop.dto.output.Category;

import com.hooper.hoshop.dto.output.JsonOutput;
import com.hooper.hoshop.entity.Category;

import java.util.List;

/**
 * Created by 47123 on 2016/5/13.
 */
public class CategoryRootOutput extends JsonOutput {

    private List<Category> roots;

    public List<Category> getRoots() {
        return roots;
    }

    public void setRoots(List<Category> roots) {
        this.roots = roots;
    }
}
