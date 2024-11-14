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
        String userPwdConfirm = request.getParameter("userPwdConfirm");

        // 비밀번호 확인
        if (userPwdConfirm == null || !member.getUserPwd().equals(userPwdConfirm)) {
            redirectAttributes.addFlashAttribute("message", "비밀번호가 일치하지 않습니다.");
            return "redirect:/sign_up_main.me";
        }

        // 비밀번호 암호화
        member.setUserPwd(bcryptPasswordEncoder.encode(member.getUserPwd()));

        // 이메일 조합
        String emailLocal = request.getParameter("emailLocal");
        String emailDomain = request.getParameter("emailDomain");
        if (emailLocal != null && !emailLocal.isEmpty() && emailDomain != null && !emailDomain.isEmpty()) {
            member.setEmail(emailLocal + "@" + emailDomain);
        } else {
            redirectAttributes.addFlashAttribute("message", "유효한 이메일 주소를 입력해주세요.");
            return "redirect:/sign_up_main.me";
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
    public String loginMember(Member m, HttpSession session, RedirectAttributes redirectAttributes) {
        Member loginMember = memberService.loginMember(m);

        if (loginMember != null) {
            if ("Y".equals(loginMember.getIsAdmin())) {
                // 관리자 계정 로그인
                if (m.getUserPwd().equals(loginMember.getUserPwd())) {
                    session.setAttribute("loginUser", loginMember);
                    redirectAttributes.addFlashAttribute("message", "관리자 로그인에 성공했습니다.");
                    return "redirect:/main";
                }
            } else {
                // 일반 사용자 로그인
                if (bcryptPasswordEncoder.matches(m.getUserPwd(), loginMember.getUserPwd())) {
                    session.setAttribute("loginUser", loginMember);
                    redirectAttributes.addFlashAttribute("message", "로그인에 성공했습니다.");
                    return "redirect:/main";
                }
            }
            // 비밀번호 오류
            redirectAttributes.addFlashAttribute("message", "로그인 실패. 아이디와 비밀번호를 확인하세요.");
            return "redirect:/login_main.me";
        } else {
            redirectAttributes.addFlashAttribute("message", "로그인 실패. 해당 아이디가 존재하지 않습니다.");
            return "redirect:/login_main.me";
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
                SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
                Date birthdayDate = inputFormat.parse(loginUser.getBirthday());
                SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
                model.addAttribute("formattedBirthday", outputFormat.format(birthdayDate));
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
