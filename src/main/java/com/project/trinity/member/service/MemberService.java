package com.project.trinity.member.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.project.trinity.member.model.vo.DoctorReview;
import com.project.trinity.member.model.vo.MedicalField;
import com.project.trinity.member.model.vo.Member;

public interface MemberService {

    Member loginMember(Member m);

    int idCheck(String checkId);

    int updateMember(Member member);

    int deleteMember(String userId);

    int insertMember(Member member);

    Member findByUserId(String userId);

    boolean updateProfile(Member member);

    void updateProfileImage(Member member); 
    
    Member selectMemberById(String userId);
    
    String findIdByEmail(String name, String email);
        
    String findIdByPhone(String name, String phone);
    
    Member findMemberForResetPassword(String userId, String userName, String email);

    int updateTemporaryPassword(String userId, String encryptedPassword);
    
    public int updatePassword(String userId, String encryptedPassword);

	ArrayList<Member> selectDoctorInfoList(String hosNo);

	ArrayList<DoctorReview> selectDoctorReview(String doctorNo);

	int updateHospitalDoctor(HashMap<String, String> hmap);

	int hospitalAccountDeleteDoctor(String userNo);

	MedicalField getMedicalFieldByMedNo(String medKey);

	String selectDoctorBiography(String doctorNo);

	int insertDoctorReview(String writerNo, String doctorNo, String reviewTitle, String reviewContent,
			String reviewRating);

	List<Integer> selectCountList();

    
  

    
}


