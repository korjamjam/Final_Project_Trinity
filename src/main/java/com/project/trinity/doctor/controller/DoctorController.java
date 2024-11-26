package com.project.trinity.doctor.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.trinity.doctor.model.vo.DoctorApplication;
import com.project.trinity.doctor.service.DoctorService;
import com.project.trinity.member.model.vo.Member;

@Controller
@RequestMapping("/doctor") // 기본 경로 설정
public class DoctorController {

	@Autowired
	private DoctorService doctorService;

	@PostMapping("/apply") // /doctor/apply에 매핑
	public String applyDoctor(@RequestParam("rTitle") String rTitle, @RequestParam("subject") String subject,
			@RequestParam("licPicture") MultipartFile licPicture, HttpSession session,
			RedirectAttributes redirectAttributes) {

		Member loginUser = (Member) session.getAttribute("loginUser");
		if (loginUser == null) {
			redirectAttributes.addFlashAttribute("message", "로그인이 필요합니다.");
			return "redirect:/member/login";
		}

		String savePath = "/resources/upload/doctor_cert/";
		String realPath = session.getServletContext().getRealPath(savePath);

		File uploadDir = new File(realPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdirs();
		}

		String originalFilename = licPicture.getOriginalFilename();
		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		String newFilename = "DOC_" + loginUser.getUserId() + ext;

		try {
			licPicture.transferTo(new File(realPath + newFilename));
			DoctorApplication application = new DoctorApplication();
			application.setUserNo(loginUser.getUserNo());
			application.setrTitle(rTitle); // rTitle 필드와 일치해야 함
			application.setSubject(subject);
			application.setLicPicture(savePath + newFilename);

			int result = doctorService.applyDoctor(application);

			if (result > 0) {
				redirectAttributes.addFlashAttribute("message", "의사 신청이 성공적으로 제출되었습니다.");
			} else {
				redirectAttributes.addFlashAttribute("message", "의사 신청 중 오류가 발생했습니다.");
			}
		} catch (IOException e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("message", "파일 업로드 중 오류가 발생했습니다.");
		}

		return "redirect:/member/profile_edit";
	}
}
