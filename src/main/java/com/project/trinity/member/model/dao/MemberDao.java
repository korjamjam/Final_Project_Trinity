package com.project.trinity.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.trinity.member.model.vo.FileTable;
import com.project.trinity.member.model.vo.Member;

@Repository
public class MemberDao {

	// 로그인
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

	// 아이디 중복 확인
	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
	}

	// 회원 가입
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	// 회원 정보 업데이트
	public int updateMember(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.updateMember", member);
	}

	// 회원 탈퇴
	public int deleteMember(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("memberMapper.deleteMember", userId);
	}

	// userId로 사용자 정보 조회
	public Member findByUserId(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.findByUserId", userId);
	}

	// 프로필 이미지 업데이트
	public int updateProfileImage(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.updateProfileImage", member);
	}

	// 프로필 이미지 업데이트 후 사용자 정보 조회
	public Member selectUpdatedProfile(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.findByUserId", userId);
	}
}
