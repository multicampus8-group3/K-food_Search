package com.campus.myapp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class OwnerInterceptor implements HandlerInterceptor {
	
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        
        String logType = (String)session.getAttribute("logType");
		
		if(logType!=null && logType.equals("owner")) { //사업주 계정
			return true;
		} else { // 사업주 계정이 아니라면 메인페이지로
			response.sendRedirect(request.getContextPath()+"/");
			return false;
		}
    }
}
