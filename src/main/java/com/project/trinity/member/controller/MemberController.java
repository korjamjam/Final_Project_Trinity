package com.project.trinity.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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

import com.project.trinity.community.board.model.vo.Board;
import com.project.trinity.community.board.service.BoardService;
import com.project.trinity.healthreservation.service.HealthReservationService;
import com.project.trinity.member.model.vo.Member;
import com.project.trinity.member.service.EmailService;
import com.project.trinity.member.service.MemberService;
import com.project.trinity.reservation.model.vo.HealthReservation;
import com.project.trinity.reservation.model.vo.Reservation;
import com.project.trinity.reservation.service.ReservationService;
import com.project.trinity.vaccine.model.vo.VaccineReservation;
import com.project.trinity.vaccine.service.VaccineReservationService;

@Controller
@RequestMapping("/member") // 모든 경로에 /member를 붙여 구조화
public class MemberController {

	@Autowired
	private EmailService emailService;

	private final MemberService memberService;
	private final BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private HealthReservationService healthReservationService;
	
	@Autowired
	private VaccineReservationService vaccineReservationService;
	
	@Autowired
	private BoardService boardService;




	@Autowired
	public MemberController(MemberService memberService, BCryptPasswordEncoder bcryptPasswordEncoder) {
		this.memberService = memberService;
		this.bcryptPasswordEncoder = bcryptPasswordEncoder;
	}

	@PostMapping("/insert")
	public String insertMember(Member member, HttpServletRequest request, RedirectAttributes redirectAttributes) {
	    // 비밀번호 확인
	    String userPwdConfirm = request.getParameter("userPwdConfirm");
	    if (userPwdConfirm == null || !member.getUserPwd().equals(userPwdConfirm)) {
	        redirectAttributes.addFlashAttribute("message", "비밀번호가 일치하지 않습니다.");
	        return "redirect:/member/sign_up";
	    }

	    // // 비밀번호 유효성 검사
	    // if (!isValidPassword(member.getUserPwd())) {
	    //     redirectAttributes.addFlashAttribute("message", "비밀번호는 8~16자 이내로 영문, 숫자, 특수문자를 포함해야 합니다.");
	    //     return "redirect:/member/sign_up";
	    // }

	    // 비밀번호 암호화
	    member.setUserPwd(bcryptPasswordEncoder.encode(member.getUserPwd()));

	    // 이메일 조합
	    String emailLocal = request.getParameter("emailLocal");
	    String emailDomain = request.getParameter("emailDomain");
	    if (emailLocal != null && emailDomain != null) {
	        member.setEmail(emailLocal + "@" + emailDomain);
	    }

	    // 주소 조합
	    String postcode = request.getParameter("postcode");
	    String address = request.getParameter("address");
	    String detailAddress = request.getParameter("detailAddress");
	    member.setPostcode(postcode);
	    member.setAddress(address + " " + detailAddress);

	    // 전화번호 조합
	    String phonePrefix = request.getParameter("phonePrefix");
	    String phoneMiddle = request.getParameter("phoneMiddle");
	    String phoneLast = request.getParameter("phoneLast");
	    member.setPhone(phonePrefix + "-" + phoneMiddle + "-" + phoneLast);

	    // 기본 프로필 이미지 설정
	    String defaultProfileImage = "/resources/images/default_profile.png";
	    member.setUserProfile(defaultProfileImage);

	    // 회원 가입 처리
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

	@PostMapping("/login")
	public String loginMember(Member m, HttpSession session, HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes redirectAttributes) {
		Member loginMember = memberService.loginMember(m);

		if (loginMember != null) {
			// 관리자 로그인 처리
			if ("Y".equals(loginMember.getIsAdmin())) {
				if (m.getUserPwd().equals(loginMember.getUserPwd())) {
					session.setAttribute("loginUser", loginMember);
					redirectAttributes.addFlashAttribute("message", "관리자 로그인에 성공했습니다.");
					return "redirect:/main";
				}
			} else {
				// 일반 사용자 로그인 처리
				if (bcryptPasswordEncoder.matches(m.getUserPwd(), loginMember.getUserPwd())) {
					session.setAttribute("loginUser", loginMember); // 프로필 정보 포함한 사용자 객체 세션 저장

					// 자동 로그인 처리
					if ("on".equals(request.getParameter("keepLoggedIn"))) {
						Cookie loginCookie = new Cookie("keepLoggedIn", loginMember.getUserId());
						loginCookie.setMaxAge(60 * 60 * 24 * 30);
						loginCookie.setPath("/");
						response.addCookie(loginCookie);
					}

					redirectAttributes.addFlashAttribute("message", "로그인에 성공했습니다.");
					return "redirect:/main";
				}
			}

			// 비밀번호 불일치
			redirectAttributes.addFlashAttribute("message", "로그인 실패. 아이디와 비밀번호를 확인하세요.");
			return "redirect:/member/login";
		} else {
			// 로그인 실패
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

	@RequestMapping("/profile_edit")
	public String editProfile(HttpSession session, Model model) {
		Member loginUser = (Member) session.getAttribute("loginUser");

		if (loginUser != null && loginUser.getBirthday() != null) {
			String birthday = loginUser.getBirthday(); // VARCHAR2(6) 형식: YYMMDD
			if (birthday.length() == 6) {
				String formattedBirthday = "20" + birthday.substring(0, 2) + "-" + birthday.substring(2, 4) + "-"
						+ birthday.substring(4, 6);
				model.addAttribute("formattedBirthday", formattedBirthday);
			} else {
				model.addAttribute("formattedBirthday", ""); // 형식이 잘못된 경우
			}
		} else {
			model.addAttribute("formattedBirthday", "");
		}

		model.addAttribute("loginUser", loginUser);
		return "account/profile_edit";
	}

	@PostMapping("/update_profile")
	public String updateProfile(Member member, MultipartFile profileImage, HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "redirect:/member/login?error=notLoggedIn";
		}

		System.out.println(member);
		System.out.println(profileImage);

		// 로그인 사용자 정보 복사
		member.setUserNo(loginUser.getUserNo());
		member.setUserId(loginUser.getUserId());
		member.setUserPwd(loginUser.getUserPwd());

		// 프로필 이미지 업로드 처리
		if (profileImage != null && !profileImage.isEmpty()) {
			String savePath = "/resources/upload/profile/";
			String realPath = session.getServletContext().getRealPath(savePath);

			File uploadDir = new File(realPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdirs();
			}

			String originalFilename = profileImage.getOriginalFilename();
			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
			String newFilename = loginUser.getUserId() + "_profile" + ext;

			try {
				profileImage.transferTo(new File(realPath + newFilename));
				member.setUserProfile(savePath + newFilename);
			} catch (IOException e) {
				e.printStackTrace();
				return "redirect:/member/profile_edit?error=uploadFailed";
			}
		} else {
			member.setUserProfile(loginUser.getUserProfile());
		}

		// 생년월일 데이터 변환 (YYYY-MM-DD -> YYMMDD)
		String birthday = member.getBirthday(); // YYYY-MM-DD 형식의 데이터
		if (birthday != null && !birthday.isEmpty()) {
			try {
				SimpleDateFormat originalFormat = new SimpleDateFormat("yyyy-MM-dd");
				SimpleDateFormat targetFormat = new SimpleDateFormat("yyMMdd");
				Date date = originalFormat.parse(birthday); // YYYY-MM-DD 형식을 Date로 변환
				member.setBirthday(targetFormat.format(date)); // YYMMDD 형식으로 변환 후 저장
			} catch (ParseException e) {
				e.printStackTrace();
				return "redirect:/member/profile_edit?error=dateFormatError";
			}
		}

		// 회원 정보 업데이트 처리
		int result = memberService.updateMember(member);
		if (result > 0) {
			session.setAttribute("loginUser", member);
			return "redirect:/member/profile_edit?success=updated";
		} else {
			return "redirect:/member/profile_edit?error=updateFailed";
		}
	}

	@PostMapping("/find_id_email")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> findIdByEmailAjax(@RequestParam("name") String name,
			@RequestParam("email") String email, @RequestParam("domain") String domain) {
		Map<String, Object> response = new HashMap<>();
		try {
			String fullEmail = email + "@" + domain;
			String userId = memberService.findIdByEmail(name, fullEmail);

			if (userId != null) {
				response.put("status", "success");
				response.put("userId", userId);
			} else {
				response.put("status", "fail");
				response.put("message", "입력하신 정보와 일치하는 아이디가 없습니다.");
			}
			return ResponseEntity.ok(response); // HTTP 200 상태로 반환
		} catch (Exception e) {
			response.put("status", "error");
			response.put("message", "서버 처리 중 오류가 발생했습니다.");
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response); // HTTP 500 상태로 반환
		}
	}

	@PostMapping("/find_id_phone")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> findIdByPhoneAjax(@RequestParam("phoneName") String name,
			@RequestParam("phone") String phone) {
		Map<String, Object> response = new HashMap<>();
		try {
			String userId = memberService.findIdByPhone(name, phone);

			if (userId != null) {
				response.put("status", "success");
				response.put("userId", userId);
			} else {
				response.put("status", "fail");
				response.put("message", "입력하신 정보와 일치하는 아이디가 없습니다.");
			}
			return ResponseEntity.ok(response); // HTTP 200 상태로 반환
		} catch (Exception e) {
			response.put("status", "error");
			response.put("message", "서버 처리 중 오류가 발생했습니다.");
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response); // HTTP 500 상태로 반환
		}
	}

	@PostMapping("/reset_pwd_email")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> resetPasswordByEmail(@RequestParam("id") String userId,
			@RequestParam("name") String userName, @RequestParam("email") String email,
			@RequestParam("domain") String domain) {

		Map<String, Object> response = new HashMap<>();
		String fullEmail = email + "@" + domain;

		try {
			// 사용자를 데이터베이스에서 조회
			Member member = memberService.findMemberForResetPassword(userId, userName, fullEmail);

			if (member != null) {
				// 임시 비밀번호 생성 및 암호화
				String tempPassword = UUID.randomUUID().toString().substring(0, 8);
				String encryptedPassword = bcryptPasswordEncoder.encode(tempPassword);

				// 데이터베이스에 임시 비밀번호 저장
				int updateResult = memberService.updateTemporaryPassword(userId, encryptedPassword);

				if (updateResult > 0) {
					// 이메일 발송
					String subject = "임시 비밀번호 발급";
					String content = "안녕하세요, " + userName + "님. 임시 비밀번호는 " + tempPassword
							+ " 입니다. 로그인 후 반드시 비밀번호를 변경해주세요.";
					emailService.sendEmail(fullEmail, subject, content);

					response.put("status", "success");
					response.put("message", "임시 비밀번호가 이메일로 발송되었습니다.");
				} else {
					response.put("status", "fail");
					response.put("message", "임시 비밀번호 저장 중 오류가 발생했습니다.");
				}
			} else {
				response.put("status", "fail");
				response.put("message", "입력 정보와 일치하는 사용자가 없습니다.");
			}
		} catch (Exception e) {
			response.put("status", "error");
			response.put("message", "서버 처리 중 오류가 발생했습니다.");
		}

		return ResponseEntity.ok(response);
	}

	@PostMapping("/reset_pwd_confirm")
	public String resetPasswordConfirm(@RequestParam("newPassword") String newPassword,
			@RequestParam("confirmPassword") String confirmPassword, HttpSession session,
			RedirectAttributes redirectAttributes) {

		System.out.println("[DEBUG] resetPasswordConfirm 호출됨");

		Member loginUser = (Member) session.getAttribute("loginUser");
		if (loginUser == null) {
			System.out.println("[DEBUG] 로그인 사용자 없음");
			redirectAttributes.addFlashAttribute("message", "로그인 상태에서만 비밀번호를 변경할 수 있습니다.");
			return "redirect:/member/login";
		}

		System.out.println("[DEBUG] 로그인 사용자: " + loginUser.getUserId());

		if (!newPassword.equals(confirmPassword)) {
			System.out.println("[DEBUG] 비밀번호가 일치하지 않음");
			redirectAttributes.addFlashAttribute("error", "비밀번호가 일치하지 않습니다.");
			return "redirect:/member/reset_pwd";
		}

		// if (!isValidPassword(newPassword)) {
		// 	System.out.println("[DEBUG] 비밀번호 유효성 검사 실패");
		// 	redirectAttributes.addFlashAttribute("error", "비밀번호는 영문, 숫자, 특수문자를 포함해 8자 이상이어야 합니다.");
		// 	return "redirect:/member/reset_pwd";
		// }

		String encryptedPassword = bcryptPasswordEncoder.encode(newPassword);
		System.out.println("[DEBUG] 암호화된 비밀번호: " + encryptedPassword);

		loginUser.setUserPwd(encryptedPassword);
		int result = memberService.updateMember(loginUser);

		System.out.println("[DEBUG] DB 업데이트 결과: " + result);

		if (result > 0) {
			System.out.println("[DEBUG] 비밀번호 변경 성공");
			session.setAttribute("loginUser", loginUser);
			redirectAttributes.addFlashAttribute("message", "비밀번호가 성공적으로 변경되었습니다.");
			return "redirect:/member/profile_edit";
		} else {
			System.out.println("[DEBUG] 비밀번호 변경 실패");
			redirectAttributes.addFlashAttribute("error", "비밀번호 변경에 실패했습니다. 다시 시도해주세요.");
			return "redirect:/member/reset_pwd";
		}
	}

	// 비밀번호 유효성 검사 메서드 (예시)
	private boolean isValidPassword(String password) {
		return password.matches("^(?=.*[a-zA-Z])(?=.*\\d)(?=.*[@#$%^&+=]).{8,16}$");
	}

	@PostMapping("/withdraw")
	public String withdrawMember(@RequestParam("password") String password, HttpSession session,
			RedirectAttributes redirectAttributes) {

		Member loginUser = (Member) session.getAttribute("loginUser");

		if (loginUser == null) {
			redirectAttributes.addFlashAttribute("errorMessage", "로그인이 필요합니다.");
			return "redirect:/member/login";
		}

		// 비밀번호 검증
		if (!bcryptPasswordEncoder.matches(password, loginUser.getUserPwd())) {
			redirectAttributes.addFlashAttribute("errorMessage", "비밀번호가 틀렸습니다. 다시 시도해주세요.");
			return "redirect:/member/profile_edit";
		}

		// 회원탈퇴 처리
		int result = memberService.deleteMember(loginUser.getUserId());
		if (result > 0) {
			session.invalidate();
			redirectAttributes.addFlashAttribute("successMessage", "회원탈퇴가 완료되었습니다.");
			return "redirect:/main";
		} else {
			redirectAttributes.addFlashAttribute("errorMessage", "회원탈퇴에 실패했습니다. 다시 시도해주세요.");
			return "redirect:/member/profile_edit";
		}
	}

	// 기타 페이지 매핑
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

	@GetMapping("/apply_doctor")
	public String applydoctorpage() {
		return "account/apply_doctor";
	}

	@GetMapping("/reservationconfirmation")
	public String reservationConfirmationPage(Model model, HttpSession session) {
		// 로그인된 사용자 가져오기
		Member loginUser = (Member) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "redirect:/member/login"; // 로그인 페이지로 리다이렉트
		}

		// 사용자 번호를 이용해 예약 정보 가져오기
		String userNo = loginUser.getUserNo();
		List<Reservation> reservations = reservationService.getReservationsByUserNo(userNo);
		System.out.println(reservations);
		System.out.println("Reservations: " + reservations);

		// 모델에 예약 정보 추가
		model.addAttribute("reservations", reservations);
		return "account/reservationconfirmation"; // 예약 확인 페이지 반환
	}

	@GetMapping("/healthreservationconfirmation")
	public String healthReservationConfirmationPage(Model model, HttpSession session) {
	    // 로그인된 사용자 확인
	    Member loginUser = (Member) session.getAttribute("loginUser");
	    if (loginUser == null) {
	        return "redirect:/member/login"; // 로그인 페이지로 리다이렉트
	    }

	    // 사용자 번호로 건강검진 예약 정보 가져오기
	    String userNo = loginUser.getUserNo();
	    List<HealthReservation> healthReservations = healthReservationService.getHealthReservationsByUserNo(userNo);
	    
	    System.out.println(healthReservations);
	    
	    // 건강검진 예약 정보가 없을 경우 처리
	    if (healthReservations == null || healthReservations.isEmpty()) {
	        model.addAttribute("message", "건강검진 예약 내역이 없습니다.");
	    } else {
	        model.addAttribute("healthReservations", healthReservations);
	    }

	    return "account/healthreservationconfirmation"; // 건강검진 예약 확인 페이지 반환
	}
	
	@GetMapping("/vaccinereservationconfirmation")
    public String vaccineReservationConfirmationPage(Model model, HttpSession session) {
        // 로그인된 사용자 확인
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/member/login"; // 로그인 페이지로 리다이렉트
        }

        // 로그인된 사용자 번호로 백신 예약 정보 가져오기
        String userNo = loginUser.getUserNo();
        List<VaccineReservation> reservations = vaccineReservationService.getReservationsByUserNo(userNo);


        // 예약 정보가 없을 경우 메시지 처리
        if (reservations == null || reservations.isEmpty()) {
            model.addAttribute("message", "백신 예약 내역이 없습니다.");
        } else {
            model.addAttribute("reservations", reservations);
        }

        // 예약 확인 페이지 반환
        return "account/vaccinereservationconfirmation";
    }
	
	@GetMapping("/mypost")
	public String getMyPosts(HttpSession session, Model model) {
	    // 로그인된 사용자 가져오기
	    Member loginUser = (Member) session.getAttribute("loginUser");
	    if (loginUser == null) {
	        return "redirect:/member/login"; // 로그인 페이지로 리다이렉트
	    }

	    // 사용자 번호로 내가 쓴 게시글 조회
	    List<Board> myposts = boardService.getPostsByUserNo(loginUser.getUserNo());
	    model.addAttribute("myposts", myposts);

	    return "account/mypost";
	}



}
