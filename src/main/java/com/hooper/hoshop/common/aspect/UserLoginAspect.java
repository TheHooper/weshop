package com.hooper.hoshop.common.aspect;

import com.hooper.hoshop.common.aspect.annotation.UserLoginAnnotation;
import com.hooper.hoshop.common.constant.WebConstant;
import com.hooper.hoshop.common.exception.UserUnloginException;
import com.hooper.hoshop.entity.User;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpSession;

/**
 * Created by 47123 on 2016/5/21.
 */
@Aspect
@Component
public class UserLoginAspect {

    @Pointcut("@annotation(com.hooper.hoshop.common.aspect.annotation.UserLoginAnnotation)")
    public void userAccess() {
    }

//    @After("userAccess()")
//    public void after(JoinPoint joinPoint) {
//        System.out.println("after aspect executed");
//    }

    @Before(value = "userAccess()&&" +
            "@annotation(userLoginAnnotation)")
    public void before(JoinPoint joinPoint, UserLoginAnnotation userLoginAnnotation) {
        //如果需要这里可以取出参数进行处理
        //Object[] args = joinPoint.getArgs();
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpSession session = attr.getRequest().getSession(true);
        User user = (User) session.getAttribute(WebConstant.SESSION_SIGNIN_USER);
        if (user == null) {
            throw new UserUnloginException();
        } else {

        }
//        throw new UserUnloginException();
    }

//    @AfterReturning(pointcut = "userAccess()", returning = "returnVal")
//    public void afterReturning(JoinPoint joinPoint, Object returnVal) {
//        System.out.println("afterReturning executed, return result is "
//                + returnVal);
//    }

//        @Around(value = "userAccess()&&" +
//            "@annotation(userLoginAnnotation)")
//    public void around(ProceedingJoinPoint pjp, UserLoginAnnotation userLoginAnnotation) throws Throwable {
//            //如果需要这里可以取出参数进行处理
//            //Object[] args = joinPoint.getArgs();
//            ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
//            HttpSession session = attr.getRequest().getSession(true);
//            HttpServletRequest request = attr.getRequest();
//            User user = (User) session.getAttribute(WebConstant.SESSION_SIGNIN_USER);
//            if (user == null) {
//                ModelAndView modelAndView = new ModelAndView("/user/login");
//                modelAndView.addObject("backUrl",request.getRequestURI());
//                Object[] objects = new Object[1];
//                objects[0] = modelAndView;
//                pjp.proceed(objects);
//            } else {
//                pjp.proceed();
//            }
////        throw new UserUnloginException()
//    }

//    @Around("userAccess()")
//    public void around(ProceedingJoinPoint pjp) throws Throwable {
//        System.out.println("around start..");
//        try {
//            pjp.proceed();
//        } catch (Throwable ex) {
//            System.out.println("error in around");
//            throw ex;
//        }
//        System.out.println("around end");
//    }

//    @AfterThrowing(pointcut = "userAccess()", throwing = "error")
//    public void afterThrowing(JoinPoint jp, Throwable error) {
//        System.out.println("error:" + error);
//    }

}
