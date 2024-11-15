package com.project.trinity.common.interceptor;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.trinity.member.model.vo.Member;
import com.project.trinity.member.service.MemberService;

@Component
public class loginfilter implements Filter {

    @Autowired
    private MemberService memberService;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws java.io.IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        if (session == null || session.getAttribute("loginUser") == null) {
            Cookie[] cookies = httpRequest.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if ("keepLoggedIn".equals(cookie.getName())) {
                        String userId = cookie.getValue();
                        Member member = memberService.findByUserId(userId);
                        if (member != null) {
                            // 세션을 새로 만들고 로그인 사용자 정보 설정
                            session = httpRequest.getSession();
                            session.setAttribute("loginUser", member);
                        }
                    }
                }
            }
        }
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {}
}
