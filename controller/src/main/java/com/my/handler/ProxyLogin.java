package com.my.handler;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ProxyLogin implements HandlerInterceptor {

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        if(session != null) {
            String proxyLogin = (String) session.getAttribute("proxyLogin");
            if( proxyLogin == null ){
                session.setAttribute("proxyLogin","F");
            }
        }
        return true;
    }
}
