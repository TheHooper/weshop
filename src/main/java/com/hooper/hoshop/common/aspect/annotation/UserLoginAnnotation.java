package com.hooper.hoshop.common.aspect.annotation;

import com.hooper.hoshop.common.Enum.UserAuthEnum;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * Created by 47123 on 2016/5/21.
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface UserLoginAnnotation {
//    UserAuthEnum isLogin();
}
