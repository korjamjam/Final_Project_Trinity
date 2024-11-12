package com.project.trinity.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//return : true -> 기존요청흐름대로 진행(Controller로 이동)
		//return : false -> 요청중단후 반환
		System.out.println("인터셉터 실행중...");
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser") != null) {
			System.out.println("접속 가능");
			return true;
		} else {
			session.setAttribute("alertMsg", "로그인 후 이용가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath());
			System.out.println("접속 불가");
			return false;
		}
	}
	
}