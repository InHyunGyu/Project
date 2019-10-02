package com.debugking.www.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession(); 
		
		String memberId = (String) session.getAttribute("memberId");
		if(memberId == null){
			
			String path = request.getContextPath() + "/login"; 
			
			response.sendRedirect(path);
			return false; 
		}
		
		return super.preHandle(request, response, handler);
		//이 return 내용은 요청했던 화면으로 가라는 의미이다. 
	}
}
