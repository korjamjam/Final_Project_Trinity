package com.project.trinity.member.service;

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
}
