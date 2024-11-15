package com.project.trinity.member.service;

import com.project.trinity.member.model.vo.Member;

public interface MemberService {

	Member loginMember(Member m);

	int idCheck(String checkId);

	int updateMember(Member m);

	int deleteMember(String userId);

	int insertMember(Member member);

	Member findByUserId(String userId);


}
