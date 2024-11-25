package com.project.trinity.member.service;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.trinity.member.model.dao.MemberDao;
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

    // 프로필 이미지 업데이트
    @Override
    public void updateProfileImage(Member member) {
        if (member != null) {
            memberDao.updateProfileImage(sqlSession, member);
        }
    }

    // 이메일로 아이디 찾기
    @Override
    public String findIdByEmail(String name, String email) {
        return memberDao.findIdByEmail(sqlSession, name, email);
    }

    // 휴대전화로 아이디 찾기
    @Override
    public String findIdByPhone(String name, String phone) {
        return memberDao.findIdByPhone(sqlSession, name, phone);
    }

    @Override
    public Member selectMemberById(String userId) {
        return memberDao.findByUserId(sqlSession, userId);
    }
    
    @Override
    public Member findMemberForResetPassword(String userId, String userName, String email) {
        Map<String, Object> params = new HashMap<>();
        params.put("userId", userId);
        params.put("userName", userName);
        params.put("email", email);
        return memberDao.findMemberForResetPassword(sqlSession, params);
    }

    @Override
    public int updateTemporaryPassword(String userId, String encryptedPassword) {
        Map<String, Object> params = new HashMap<>();
        params.put("userId", userId);
        params.put("encryptedPassword", encryptedPassword);
        return memberDao.updateTemporaryPassword(sqlSession, params);
    }


}
