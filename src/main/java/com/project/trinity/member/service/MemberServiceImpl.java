package com.project.trinity.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.project.trinity.member.model.dao.MemberDao;
import com.project.trinity.member.model.vo.FileTable;
import com.project.trinity.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private MemberDao memberDao;

	// 로그인 처리
	@Override
	public Member loginMember(Member m) {
		return memberDao.loginMember(sqlSession, m);
	}

	// 아이디 중복 확인
	@Override
	public int idCheck(String checkId) {
		return memberDao.idCheck(sqlSession, checkId);
	}

	// 회원가입
	@Override
	public int insertMember(Member m) {
		return memberDao.insertMember(sqlSession, m);
	}

	// 회원정보 업데이트
	@Override
	public int updateMember(Member member) {
		return memberDao.updateMember(sqlSession, member);
	}

	// 회원 탈퇴
	@Override
	public int deleteMember(String userId) {
		return memberDao.deleteMember(sqlSession, userId);
	}

	// userId로 회원 정보 조회
	@Override
	public Member findByUserId(String userId) {
		return memberDao.findByUserId(sqlSession, userId);
	}

	// 프로필 정보 업데이트
	@Override
	public boolean updateProfile(Member member) {
		int result = memberDao.updateMember(sqlSession, member);
		return result > 0;
	}

	@Override
	public void updateProfileImage(Member member) {
		if (member != null) {
			memberDao.updateProfileImage(sqlSession, member);
		}
	}

	// userId로 회원 정보 조회 (중복 메서드 제거 필요)
	@Override
	public Member selectMemberById(String userId) {
		return memberDao.findByUserId(sqlSession, userId); // 중복된 메서드 findByUserId 활용
	}
}
