package com.campus.myapp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor {
	
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        
        String logStatus = (String)session.getAttribute("logStatus");
		
		if(logStatus!=null && logStatus.equals("Y")) { //로그인 상태
			return true;
		} else { // 로그아웃상태
			response.sendRedirect(request.getContextPath()+"/");
			return false;
		}
    }
}
