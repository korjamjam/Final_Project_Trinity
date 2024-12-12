package com.project.trinity.admin.service;

import java.util.List;
import java.util.Map;

import com.project.trinity.community.model.vo.Community;
import com.project.trinity.hospital.model.vo.HospitalInfo;
import com.project.trinity.member.model.vo.Member;
import com.project.trinity.member.model.vo.Rankup;
import com.project.trinity.reservation.model.vo.Reservation;

public interface AdminService {
	
	//-------회원 관리 페이지-------
    List<Member> getAllMembers(); // 모든 회원을 가져오는 메서드 선언
    
    List<Member> getMembersByRole(String role); //회원 직업별 분류
    
    Member getMemberDetail(String userNo); //회원 상세정보 조회
    
    boolean updateMember(Member member); //회원 상세정보 수정
    
    //-------등업 신청 페이지-------
    List<Rankup> getAllRankups(); // 등업 신청 목록 조회
    
    public Rankup getRankupDetail(String seqNo);
    
    void approveRankup(String seqNo); // 등업 승인
    
    void rejectRankup(String seqNo);  // 등업 거부
    
    void setRankupToWaiting(String seqNo); // 등업 신청 상태를 대기로 설정
    
    //-------병원 관리 페이지-------
    List<HospitalInfo> getAllHospitals();
    
    List<HospitalInfo> getHospitalsByDepartment(String department); // 진료과목별 병원 가져오기
    
    HospitalInfo getHospitalDetail(String hosNo); //회원 상세정보 조회
    
    boolean updateHospital(HospitalInfo hospital);
    
    //-------예약 관리 페이지-------
    List<Reservation> getAllReservations(); // 모든 예약 조회
    
    Map<String, Object> getReservationDetail(String reservationNo);
    
    //-------게시글 관리 페이지-------
    List<Community> getAllPosts();

    
}