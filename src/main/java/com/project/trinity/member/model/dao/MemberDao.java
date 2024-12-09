package com.project.trinity.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.trinity.member.model.vo.DoctorReview;
import com.project.trinity.member.model.vo.Member;

@Repository
public class MemberDao {

	// 로그인
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		System.out.println("[DEBUG] loginMember 호출 - 입력값: " + m);
		Member result = sqlSession.selectOne("memberMapper.loginMember", m);
		System.out.println("[DEBUG] loginMember 결과: " + result);
		return result;
	}

	// 아이디 중복 확인
	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		System.out.println("[DEBUG] idCheck 호출 - 체크 아이디: " + checkId);
		int result = sqlSession.selectOne("memberMapper.idCheck", checkId);
		System.out.println("[DEBUG] idCheck 결과: " + result);
		return result;
	}

	// 회원 가입
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		System.out.println("[DEBUG] insertMember 호출 - 입력값: " + m);
		int result = sqlSession.insert("memberMapper.insertMember", m);
		System.out.println("[DEBUG] insertMember 결과: " + result);
		return result;
	}

	// 회원 정보 업데이트
	public int updateMember(SqlSessionTemplate sqlSession, Member member) {
		System.out.println("[DEBUG] updateMember 호출 - 입력값: " + member);
		int result = sqlSession.update("memberMapper.updateMember", member);
		System.out.println("[DEBUG] updateMember 결과: " + result);
		return result;
	}

	// 회원 탈퇴
	public int deleteMember(SqlSessionTemplate sqlSession, String userId) {
		System.out.println("[DEBUG] deleteMember 호출 - 사용자 ID: " + userId);
		int result = sqlSession.update("memberMapper.deleteMember", userId);
		System.out.println("[DEBUG] deleteMember 결과: " + result);
		return result;
	}

	// userId로 사용자 정보 조회
	public Member findByUserId(SqlSessionTemplate sqlSession, String userId) {
		System.out.println("[DEBUG] findByUserId 호출 - 사용자 ID: " + userId);
		Member result = sqlSession.selectOne("memberMapper.findByUserId", userId);
		System.out.println("[DEBUG] findByUserId 결과: " + result);
		return result;
	}

	// 프로필 이미지 업데이트
	public int updateProfileImage(SqlSessionTemplate sqlSession, Member member) {
		System.out.println("[DEBUG] updateProfileImage 호출 - 입력값: " + member);
		int result = sqlSession.update("memberMapper.updateProfileImage", member);
		System.out.println("[DEBUG] updateProfileImage 결과: " + result);
		return result;
	}

	// 프로필 이미지 업데이트 후 사용자 정보 조회
	public Member selectUpdatedProfile(SqlSessionTemplate sqlSession, String userId) {
		System.out.println("[DEBUG] selectUpdatedProfile 호출 - 사용자 ID: " + userId);
		Member result = sqlSession.selectOne("memberMapper.findByUserId", userId);
		System.out.println("[DEBUG] selectUpdatedProfile 결과: " + result);
		return result;
	}

	// 이메일로 아이디 찾기
	public String findIdByEmail(SqlSessionTemplate sqlSession, String userName, String email) {
		System.out.println("[DEBUG] findIdByEmail 호출 - 이름: " + userName + ", 이메일: " + email);
		Map<String, Object> params = new HashMap<>();
		params.put("userName", userName);
		params.put("email", email);
		String result = sqlSession.selectOne("memberMapper.findIdByEmail", params);
		System.out.println("[DEBUG] findIdByEmail 결과: " + result);
		return result;
	}

	// 휴대전화로 아이디 찾기
	public String findIdByPhone(SqlSessionTemplate sqlSession, String userName, String phone) {
        System.out.println("[DEBUG] findIdByPhone 호출 - 이름: " + userName + ", 휴대전화: " + phone);
        Map<String, Object> params = new HashMap<>();
        params.put("userName", userName);
        params.put("phone", phone);
        String result = sqlSession.selectOne("memberMapper.findIdByPhone", params);
        System.out.println("[DEBUG] findIdByPhone 결과: " + result);
        return result;
    }
	
	
	public Member findMemberForResetPassword(SqlSessionTemplate sqlSession, Map<String, Object> params) {
	    return sqlSession.selectOne("memberMapper.findMemberForResetPassword", params);
	}

	public int updateTemporaryPassword(SqlSessionTemplate sqlSession, Map<String, Object> params) {
	    return sqlSession.update("memberMapper.updateTemporaryPassword", params);
	}
	
	 public int updatePassword(SqlSession sqlSession, Map<String, String> params) {
	        return sqlSession.update("memberMapper.updatePassword", params);
	    }

	public ArrayList<Member> selectDoctorInfoList(SqlSessionTemplate sqlSession, String hosNo) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectDoctorInfoList", hosNo);
	}

	public ArrayList<DoctorReview> selectDoctorReview(SqlSessionTemplate sqlSession, String doctorNo) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectDoctorReview", doctorNo);
	}
	
	public int updateHospitalDoctor(SqlSessionTemplate sqlSession, HashMap<String, String> hmap) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.updateHospitalDoctor", hmap);
	}
	

}
