package com.project.trinity.hospital.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.trinity.hospital.model.vo.HospitalAccount;
import com.project.trinity.hospital.model.vo.HospitalInfo;
import com.project.trinity.hospital.service.HospitalService;
import com.project.trinity.member.model.vo.DoctorReview;
import com.project.trinity.member.model.vo.Member;
import com.project.trinity.member.service.MemberService;
import com.project.trinity.reservation.model.vo.Reservation;
import com.project.trinity.reservation.service.ReservationService;

@Controller
@RequestMapping("hospital")
public class HospitalController {
	@Autowired
	private final HospitalService hospitalService;
	private final BCryptPasswordEncoder bcryptPasswordEncoder;
	private final MemberService memberService;
	private final ReservationService reservationService;
	
	@Autowired
	public HospitalController(HospitalService hospitalService, 
			MemberService memberService, 
			BCryptPasswordEncoder bcryptPasswordEncoder,
			ReservationService reservationService) {
	    this.hospitalService = hospitalService;
	    this.memberService = memberService;
		this.bcryptPasswordEncoder = bcryptPasswordEncoder;
		this.reservationService = reservationService;
	}

	
	
	@RequestMapping("/list")
	public String hospitalList(@RequestParam(value = "subject", defaultValue = "listAll") String subject,
	        				   @RequestParam(value = "order", defaultValue = "ASC") String order, 
	        				   Model m) {
		System.out.println(subject);
		System.out.println(order);
//		ArrayList<HospitalInfo> list = hospitalService.selectHospitalList(subject, order);
//		m.addAttribute("list", list);

//		System.out.println(list);
		return "hospital_detail/hospital_list";
	}
	
	@RequestMapping("/list/api")
    @ResponseBody
    public ArrayList<HospitalInfo> hospitalListPaginated(@RequestParam(value = "keyword", defaultValue = "") String keyword,
    													 @RequestParam(value = "subject", defaultValue = "listAll") String subject,
                                                         @RequestParam(value = "order", defaultValue = "ASC") String order,
                                                         @RequestParam(value = "page", defaultValue = "1") int page,
                                                         @RequestParam(value = "limit", defaultValue = "10") int limit,
                                                         Model m) {
		System.out.println("subject : " + subject);
		System.out.println("order : " + order);
		System.out.println("page : " + page);
		System.out.println("limit : " + limit);
		System.out.println("keyword : " + keyword);
        if(!keyword.equals("")) {
    		return hospitalService.searchHospital(keyword, subject, order, page, limit);
        } else {
            return hospitalService.selectHospitalListPaginated(subject, order, page, limit);

        }
    }
	
	@RequestMapping("/detail")
	public String hospitalDetail(String hosNo, Model m) {
		HospitalInfo hInfo = hospitalService.selectHospitalInfo(hosNo);
		ArrayList<Member> dList = memberService.selectDoctorInfoList(hosNo);
		double rating[] = new double[dList.size()];
		for(int i = 0; i < dList.size(); i++) {
			//map만들기
			//key -> docInfo = 0
			//key -> reviewAvgScore = 0
			String userNo = dList.get(i).getUserNo();
			System.out.println("userNO : " + userNo);
			ArrayList<DoctorReview> docRev = memberService.selectDoctorReview(userNo);
			double avg = 0;
			if (docRev.size() > 0) {
				for(int j = 0; j < docRev.size(); j++) {
					avg += docRev.get(j).getReviewRating();
				}
				
				System.out.println(avg);
				System.out.println(docRev.size());
				avg /= docRev.size();
			}
			
			
			rating[i] = avg;
			System.out.println(rating[i]); 
		}
		
		m.addAttribute("h",h);
		m.addAttribute("hInfo",hInfo);
		m.addAttribute("dList",dList);
		m.addAttribute("rating", rating);
		
	
		return "hospital_detail/hospital_detail";
	}
	
	@RequestMapping("/list/openHos")
	public String OpenHospitalList(Model m) {
		ArrayList<HospitalInfo> searchList = hospitalService.selectOpenHospitalList();
		//여기부터 고치면됨. requestparam 추가하고 리스트 띄우기
		m.addAttribute("list", searchList);
		return "hospital_detail/openHospital_list";
	}
	
	@RequestMapping("/list/openHosApi")
    @ResponseBody
    public ArrayList<HospitalInfo> openHospitalListPaginated(@RequestParam(value = "subject", defaultValue = "listAll") String subject,
												             @RequestParam(value = "order", defaultValue = "ASC") String order,
												    		 @RequestParam(value = "page", defaultValue = "1") int page,
                                                         	 @RequestParam(value = "limit", defaultValue = "10") int limit) {
        return hospitalService.selectOpenHospitalListPaginated(subject, order, page, limit);
    }
	
	@RequestMapping("/account/insert")
	public String insertHospitalAccount(@ModelAttribute HospitalAccount hosAccount,
										 HttpServletRequest request,
										 RedirectAttributes redirectAttributes,
										 Model m
			) {
		System.out.println(hosAccount);
		String userPwdConfirm = request.getParameter("userPwdConfirm");

	    if (userPwdConfirm == null || !hosAccount.getHosPwd().equals(userPwdConfirm)) {
	        redirectAttributes.addFlashAttribute("message", "비밀번호가 일치하지 않습니다.");
	        return "redirect:/hospital/account/sign_up";
	    }
	    
	    hosAccount.setHosPwd(bcryptPasswordEncoder.encode(hosAccount.getHosPwd()));
	    
	    int result = hospitalService.insertHospital(hosAccount);
	    m.addAttribute("hosAcNo", hosAccount.getHosAcNo());
	    System.out.println(hosAccount.getHosAcNo());
	    if (result > 0) {
	        redirectAttributes.addFlashAttribute("message", "회원가입에 성공했습니다.");
	        return "redirect:/hospital/account/login";
	    } else {
	        redirectAttributes.addFlashAttribute("message", "회원가입에 실패했습니다. 다시 시도해주세요.");
	        return "redirect:/hospital/account/sign_up";
	    }
	}
	
	@RequestMapping("/account/login")
	public String HospitalAccountLogin(HospitalAccount hosAccount,
									   HttpSession session
			) {
		HospitalAccount loginHosAccount = hospitalService.loginHosAccount(hosAccount);
		
		if(loginHosAccount == null) {
			session.setAttribute("message", "로그인 실패 아이디를 확인하세요");
			return "hospital_detail/hospital_account_login";
		} else {
			if(bcryptPasswordEncoder.matches(hosAccount.getHosPwd(), loginHosAccount.getHosPwd())) {
				session.setAttribute("loginHosAccount", loginHosAccount);
				return "hospital_detail/hospital_account_main";
			} else {
				session.setAttribute("message", "로그인 실패 아이디와 비밀번호를 확인하세요");
				return "hospital_detail/hospital_account_login";
			}
		}
		
	}
	
	@RequestMapping("account/logout")
	public String logoutMember(HttpSession session, HttpServletResponse response) {
		session.invalidate();

		return "redirect:/";
	}
	
	// 아이디 중복 확인
	@ResponseBody
	@GetMapping("/idCheck")
	public int idCheck(@RequestParam("userId") String checkId) {
		return hospitalService.idCheck(checkId);
	}
	
	@RequestMapping("/account/doctor")
	public String HospitalAccountDoctor(HttpSession session) {
		HospitalAccount loginHosAccount = (HospitalAccount)session.getAttribute("loginHosAccount");
		String hosNo = loginHosAccount.getHosNo();		
		System.out.println("hosNo : " + hosNo);
		
		ArrayList<Member> hosDrList = memberService.selectDoctorInfoList(hosNo);
		System.out.println(hosDrList);
		session.setAttribute("hosDrList", hosDrList);
		
		return "hospital_detail/hospital_account_doctor";
	}
	
	@RequestMapping("account/insert/doctor")
	public String HospitalAccountInsertDoctorMember(@RequestParam("userId") String userId,
													HttpSession session
			) {
		HospitalAccount loginHosAccount = (HospitalAccount)session.getAttribute("loginHosAccount");
		String hosNo = loginHosAccount.getHosNo();
		
		HashMap<String, String> hmap = new HashMap<String, String>();
		hmap.put("userId", userId);
		hmap.put("hosNo",hosNo);
		
		int result = memberService.updateHospitalDoctor(hmap);
		
		if(result>0) {
			session.setAttribute("message", "의사 등록 성공");
		} else {
			session.setAttribute("message", "의사 등록 실패");
		}
		
		return "hospital_detail/hospital_account_doctor";	
	}//그냥 회원번호 맞게 입력하면 그거 hos_no만 바꿔줌 아이디 다르면 안되고 의사 아니면 안되게 수정해야함
	
	@RequestMapping("/account/myHospital")
	public String HospitalAccountMyHospital(HttpSession session) {
		HospitalAccount loginHosAccount = (HospitalAccount)session.getAttribute("loginHosAccount");
		String hosNo = loginHosAccount.getHosNo(); 
		
		HospitalInfo hosInfo = hospitalService.selectHospitalInfo(hosNo);
		System.out.println(hosInfo);
		
		session.setAttribute("hosInfo", hosInfo);
		
		return "hospital_detail/hospital_account_my_hospital";
	}
	
	@RequestMapping("/account/myReservation")
	public String HospitalAccountMyReservation(HttpSession session, Model m) {
		HospitalAccount loginHosAccount = (HospitalAccount)session.getAttribute("loginHosAccount");
		String hosNo = loginHosAccount.getHosNo();
		
		ArrayList<Reservation> resList = reservationService.selectReservationHosNo(hosNo);
		System.out.println("resList : " + resList);
		
		session.setAttribute("resList", resList);
		
		return "hospital_detail/hospital_account_my_reservation";
	}
	
	//화면 이동 하는거
	
	@RequestMapping("account/insertDr")
	public String HospitalAccountInsertDoctor() {
		return "hospital_detail/hospital_account_insert_doctor";	
	}
	
	@RequestMapping("/account/main")
	public String HospitalAccountMain() {
		return "hospital_detail/hospital_account_main";
	}
	
	@RequestMapping("/login")
	public String HospitalAccountLoginShow() {
		return "hospital_detail/hospital_account_login";
	}
	
	@RequestMapping("/account/sign_up")
	public String HospitalAccountSignUp() {
		return "hospital_detail/hospital_account_sign_up";
	}
}
