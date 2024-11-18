	package com.project.trinity.member.controller;
	
	import javax.servlet.http.Cookie;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	import javax.servlet.http.HttpSession;
	
	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
	import org.springframework.stereotype.Controller;
	import org.springframework.ui.Model;
	import org.springframework.web.bind.annotation.GetMapping;
	import org.springframework.web.bind.annotation.ModelAttribute;
	import org.springframework.web.bind.annotation.PostMapping;
	import org.springframework.web.bind.annotation.RequestMapping;
	import org.springframework.web.bind.annotation.RequestParam;
	import org.springframework.web.bind.annotation.ResponseBody;
	import org.springframework.web.multipart.MultipartFile;
	import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.trinity.member.model.vo.FileTable;
import com.project.trinity.member.model.vo.Member;
	import com.project.trinity.member.service.MemberService;
	
	import java.io.File;
	import java.io.IOException;
	import java.text.ParseException;
	import java.text.SimpleDateFormat;
	import java.util.Date;
	
	@Controller
	@RequestMapping("/member")  // 모든 경로에 /member를 붙여 구조화
	public class MemberController {
	
	    private final MemberService memberService;
	    private final BCryptPasswordEncoder bcryptPasswordEncoder;
	
	    @Autowired
	    public MemberController(MemberService memberService, BCryptPasswordEncoder bcryptPasswordEncoder) {
	        this.memberService = memberService;
	        this.bcryptPasswordEncoder = bcryptPasswordEncoder;
	    }
	
	    // 회원가입 기능
	    @PostMapping("/insert")
	    public String insertMember(Member member, HttpServletRequest request, RedirectAttributes redirectAttributes) {
	        String userPwdConfirm = request.getParameter("userPwdConfirm");
	
	        if (userPwdConfirm == null || !member.getUserPwd().equals(userPwdConfirm)) {
	            redirectAttributes.addFlashAttribute("message", "비밀번호가 일치하지 않습니다.");
	            return "redirect:/member/sign_up";
	        }
	
	        member.setUserPwd(bcryptPasswordEncoder.encode(member.getUserPwd()));
	
	        String emailLocal = request.getParameter("emailLocal");
	        String emailDomain = request.getParameter("emailDomain");
	        if (emailLocal != null && !emailLocal.isEmpty() && emailDomain != null && !emailDomain.isEmpty()) {
	            member.setEmail(emailLocal + "@" + emailDomain);
	        } else {
	            redirectAttributes.addFlashAttribute("message", "유효한 이메일 주소를 입력해주세요.");
	            return "redirect:/member/sign_up";
	        }
	
	        // 주소 필드 조합 및 설정
	        String postcode = request.getParameter("postcode");
	        String address = request.getParameter("address");
	        String detailAddress = request.getParameter("detailAddress");
	        String extraAddress = request.getParameter("extraAddress");
	
	        String fullAddress = postcode + " " + address + " " + detailAddress + " " + extraAddress;
	        member.setAddress(fullAddress);
	
	        int result = memberService.insertMember(member);
	        if (result > 0) {
	            redirectAttributes.addFlashAttribute("message", "회원가입에 성공했습니다.");
	            return "redirect:/member/login";
	        } else {
	            redirectAttributes.addFlashAttribute("message", "회원가입에 실패했습니다. 다시 시도해주세요.");
	            return "redirect:/member/sign_up";
	        }
	    }
	
	    // 아이디 중복 확인
	    @ResponseBody
	    @GetMapping("/idCheck")
	    public int idCheck(@RequestParam("userId") String checkId) {
	        return memberService.idCheck(checkId);
	    }
	
	
	    // 로그인 기능
	    @PostMapping("/login")
	    public String loginMember(Member m, HttpSession session, HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) {
	        Member loginMember = memberService.loginMember(m);
	
	        if (loginMember != null) {
	            if ("Y".equals(loginMember.getIsAdmin())) {
	                if (m.getUserPwd().equals(loginMember.getUserPwd())) {
	                    session.setAttribute("loginUser", loginMember);
	                    redirectAttributes.addFlashAttribute("message", "관리자 로그인에 성공했습니다.");
	                    return "redirect:/main";
	                }
	            } else {
	                if (bcryptPasswordEncoder.matches(m.getUserPwd(), loginMember.getUserPwd())) {
	                    session.setAttribute("loginUser", loginMember);
	                    session.setAttribute("userNo", loginMember.getUserNo());
	
	                    if ("on".equals(request.getParameter("keepLoggedIn"))) {
	                        Cookie loginCookie = new Cookie("keepLoggedIn", loginMember.getUserId());
	                        loginCookie.setMaxAge(60 * 60 * 24 * 30);
	                        loginCookie.setPath("/");
	                        response.addCookie(loginCookie);
	                    }
	                    
	                    System.out.println("로그인 성공 - 사용자 세션에 저장된 정보: " + session.getAttribute("loginUser"));
	                    System.out.println("세션에 저장된 userNo: " + session.getAttribute("userNo"));
	                    
	                    redirectAttributes.addFlashAttribute("message", "로그인에 성공했습니다.");
	                    System.out.println("로그인 후 리다이렉트 - /main으로 이동");
	                    return "redirect:/main";
	                }
	            }
	            redirectAttributes.addFlashAttribute("message", "로그인 실패. 아이디와 비밀번호를 확인하세요.");
	            return "redirect:/member/login";
	        } else {
	            redirectAttributes.addFlashAttribute("message", "로그인 실패. 해당 아이디가 존재하지 않습니다.");
	            return "redirect:/member/login";
	        }
	    }
	
	    // 로그아웃 기능
	    @RequestMapping("/logout")
	    public String logoutMember(HttpSession session, HttpServletResponse response) {
	        session.invalidate();
	
	        Cookie loginCookie = new Cookie("keepLoggedIn", null);
	        loginCookie.setMaxAge(0);
	        loginCookie.setPath("/");
	        response.addCookie(loginCookie);
	
	        return "redirect:/";
	    }
	
	    // 개인정보 수정 페이지 접근
	    @RequestMapping("/profile_edit")
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
	    
	    @PostMapping("/update_profile")
	    public String updateProfile(@RequestParam("profileImage") MultipartFile file,
	                                HttpSession session,
	                                RedirectAttributes redirectAttributes) {
	        Member loginUser = (Member) session.getAttribute("loginUser");
	        if (loginUser == null) {
	            redirectAttributes.addFlashAttribute("errorMessage", "로그인이 필요합니다.");
	            return "redirect:/member/login";
	        }

	        if (!file.isEmpty()) {
	            String originName = file.getOriginalFilename(); // 원래 파일명
	            String changeName = System.currentTimeMillis() + "_" + originName; // 고유한 파일명 생성
	            String savePath = "C:/upload/" + changeName; // 실제 저장 경로 수정 (로컬 저장 경로 설정)

	            try {
	                // 파일 저장
	                file.transferTo(new File(savePath));

	                // 파일 정보를 DB에 저장
	                FileTable fileTable = new FileTable();
	                fileTable.setUserNo(loginUser.getUserNo()); // 로그인한 사용자의 userNo 설정
	                fileTable.setOriginName(originName);
	                fileTable.setChangeName(changeName);

	                // 기존 프로필 삭제 및 새 파일 정보 저장
	                memberService.updateProfileImage(fileTable);

	                // 세션 업데이트
	                loginUser.setProfileImage(changeName); // Member에 프로필 이미지 설정
	                session.setAttribute("loginUser", loginUser);

	                redirectAttributes.addFlashAttribute("message", "프로필이 성공적으로 업데이트되었습니다.");
	            } catch (IOException e) {
	                e.printStackTrace();
	                redirectAttributes.addFlashAttribute("errorMessage", "프로필 이미지 저장에 실패했습니다.");
	            }
	        } else {
	            redirectAttributes.addFlashAttribute("errorMessage", "업로드할 파일이 없습니다.");
	        }

	        return "redirect:/member/profile_edit";
	    }



	
	
	    @GetMapping("/login")
	    public String showLoginPage() {
	        return "account/login";
	    }
	
	    @GetMapping("/reset_pwd")
	    public String resetpwdPage() {
	        return "account/reset_pwd";
	    }
	
	    @GetMapping("/search_id")
	    public String searchidPage() {
	        return "account/search_id";
	    }
	
	    @GetMapping("/search_pwd")
	    public String searchpwdPage() {
	        return "account/search_pwd";
	    }
	
	    @GetMapping("/sign_up")
	    public String signupPage() {
	        return "account/sign_up";
	    }
	    
	    @GetMapping("/repair_email")
	    public String repairemailPage() {
	        return "account/repair_email";
	    }
	    
	    @PostMapping("/member/update_profile")
	    public String updateProfile(@RequestParam("profileImage") MultipartFile file, HttpSession session) {
	        // 파일 저장 로직 구현
	        String fileName = file.getOriginalFilename();
	        String savePath = "path/to/save/" + fileName;
	        
	        try {
	            file.transferTo(new File(savePath));
	            // 저장 경로를 DB에 업데이트
	            // session에 저장된 유저 정보 갱신
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	        
	        return "redirect:/member/profile_edit";
	    }
	
	}
