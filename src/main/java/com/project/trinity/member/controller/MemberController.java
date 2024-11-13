package com.project.trinity.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.trinity.member.model.vo.Member;
import com.project.trinity.member.service.MemberService;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class MemberController {

	private final MemberService memberService;
	private final BCryptPasswordEncoder bcryptPasswordEncoder;

	@Autowired
	
	public MemberController(MemberService memberService, BCryptPasswordEncoder bcryptPasswordEncoder) {
		this.memberService = memberService;
		this.bcryptPasswordEncoder = bcryptPasswordEncoder;
	}

	// 회원가입 기능
	@PostMapping("/member/insert")
	public String insertMember(Member member, HttpServletRequest request, RedirectAttributes redirectAttributes) {

		// 비밀번호 확인
		String userPwdConfirm = request.getParameter("userPwdConfirm");
		if (!member.getUserPwd().equals(userPwdConfirm)) {
			redirectAttributes.addFlashAttribute("message", "비밀번호가 일치하지 않습니다.");
			return "redirect:/errorPage"; // 에러 페이지로 리다이렉트
		}

		// 비밀번호 암호화
		String encPassword = bcryptPasswordEncoder.encode(member.getUserPwd());
		member.setUserPwd(encPassword);

		// 이메일 조합
		String emailLocal = request.getParameter("emailLocal");
		String emailDomain = request.getParameter("emailDomain");
		String emailSelect = request.getParameter("emailSelect");

		if ((emailDomain == null || emailDomain.isEmpty()) && emailSelect != null) {
			emailDomain = emailSelect;
		}
		if (emailLocal != null && emailDomain != null) {
			member.setEmail(emailLocal + "@" + emailDomain);
		} else {
			redirectAttributes.addFlashAttribute("message", "유효한 이메일 주소를 입력해주세요.");
			return "redirect:/errorPage";
		}

		int result = memberService.insertMember(member);

		if (result > 0) {
			redirectAttributes.addFlashAttribute("message", "회원가입에 성공했습니다.");
			return "redirect:/login_main.me";
		} else {
			redirectAttributes.addFlashAttribute("message", "회원가입에 실패했습니다. 다시 시도해주세요.");
			return "redirect:/sign_up_main.me";
		}
	}

	// 아이디 중복 확인
	@ResponseBody
	@GetMapping("/member/idCheck")
	public int idCheck(@RequestParam("userId") String checkId) {
		return memberService.idCheck(checkId);
	}

	// 로그인 기능
	@RequestMapping("login.me")
	public String loginMember(Member m, HttpSession session) {
		Member loginMember = memberService.loginMember(m);
		System.out.println("loginMember : " + loginMember);
		System.out.println("isTrue  : " + bcryptPasswordEncoder.matches(m.getUserPwd(), loginMember.getUserPwd()));

		if (loginMember != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginMember.getUserPwd())) {
			session.setAttribute("loginUser", loginMember);
			session.setAttribute("alert", "로그인에 성공했습니다.");
			return "redirect:/main"; // 로그인 성공 시 메인 화면으로 리다이렉트
		} else {
			session.setAttribute("alert", "로그인 실패. 아이디와 비밀번호를 확인하세요.");
			return "redirect:/login_main.me"; // 로그인 실패 시 로그인 페이지로 리다이렉트
		}
	}

	// 로그아웃 기능
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	// 개인정보 수정 페이지 접근
	@RequestMapping("/profile_edit_main.me")
	public String editProfile(HttpSession session, Model model) {
		Member loginUser = (Member) session.getAttribute("loginUser");

		if (loginUser != null && loginUser.getBirthday() != null) {
			try {
				// String 타입의 birthday 값을 Date로 변환
				SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd"); 
				Date birthdayDate = inputFormat.parse(loginUser.getBirthday());

				// yyyy-MM-dd 형식으로 포맷팅
				SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
				String formattedBirthday = outputFormat.format(birthdayDate);

				model.addAttribute("formattedBirthday", formattedBirthday);
			} catch (ParseException e) {
				e.printStackTrace();
				model.addAttribute("formattedBirthday", ""); 
			}
		} else {
			model.addAttribute("formattedBirthday", "");
		}

		model.addAttribute("loginUser", loginUser);
		return "account/profile_edit";
	}

	@RequestMapping("login_main.me")
	public String showLoginPage() {
		return "account/login";
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
