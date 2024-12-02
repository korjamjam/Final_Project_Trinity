package com.project.trinity.admin.service;

import java.util.List;

import com.project.trinity.member.model.vo.Member;
import com.project.trinity.member.model.vo.Rankup;

public interface AdminService {
    List<Member> getAllMembers(); // 모든 회원을 가져오는 메서드 선언
    
    List<Rankup> getAllRankups(); // 등업 신청 목록 조회
    
    public Rankup getRankupDetail(String seqNo);
    
    void approveRankup(String seqNo); // 등업 승인
    
    void rejectRankup(String seqNo);  // 등업 거부
    
    void setRankupToWaiting(String seqNo); // 등업 신청 상태를 대기로 설정
    
}