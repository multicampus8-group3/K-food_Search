package com.campus.myapp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;


public class LoginInterceptor implements HandlerInterceptor {
	//컨트롤러가 호출되기 전에 실행될 메소드
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		//false가 리턴되면 - 로그인으로 보내기
		//true가 리턴되면 - 해당컨트롤러로 이동
		
		//request객체에서 session객체 얻어오기
		HttpSession session = request.getSession();
		
		// 로그인 상태구하기
		String logStatus = (String)session.getAttribute("logStatus");
		System.out.println(logStatus);
		
		if(logStatus!=null && logStatus.equals("Y")) { // 로그인되었을때
			return true;
		} else { // 로그인 안된경우
			response.sendRedirect("/member/login");
			return false;
		}
	}
}
