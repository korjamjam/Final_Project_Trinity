package com.project.trinity.account.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class AccountController {

	@RequestMapping("login_main.me")
	public String showLoginPage() {
		// "login_main" JSP로 포워딩
		return "account/login";
	}
	
	@RequestMapping("profile_edit_main.me")
	public String profileeditPage() {
		return "account/profile_edit";
	}
	
	@RequestMapping("reset_pwd_main.me")
	public String resetpwdPage() {
		return "account/reset_pwd";
	}
	
	@RequestMapping("search_id_main.me")
	public String searchidPage() {
		return "account/search_id";
	}
	
	@RequestMapping("search_pwd_main.me")
	public String searchpwdPage() {
		return "account/search_pwd";
	}
	
	@RequestMapping("sign_up_main.me")
	public String signupPage() {
		return "account/sign_up";
	}
	
}
