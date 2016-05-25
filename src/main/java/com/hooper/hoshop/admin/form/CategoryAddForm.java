package com.hooper.hoshop.admin.form;

import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.NotNull;

/**
 * Created by 47123 on 2016/5/13.
 */
public class CategoryAddForm {

    private String logo;

    @NotBlank(message = "类目名不能为空")
    private String typeName;

    @NotNull(message = "父类目不能为空")
    private Integer parentId;
}
