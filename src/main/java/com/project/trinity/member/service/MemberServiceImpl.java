package com.project.trinity.member.service;

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

    @Override
    public Member loginMember(Member m) {
        return memberDao.loginMember(sqlSession, m);
    }

    @Override
    public int idCheck(String checkId) {
        return memberDao.idCheck(sqlSession, checkId);
    }

    @Override
    public int insertMember(Member m) {
        return memberDao.insertMember(sqlSession, m);
    }

    @Override
    public int updateMember(Member m) {
        return memberDao.updateMember(sqlSession, m);
    }

    @Override
    public int deleteMember(String userId) {
        return memberDao.deleteMember(sqlSession, userId);
    }

    @Override
    public Member findByUserId(String userId) {
        return memberDao.findByUserId(sqlSession, userId);
    }

    // 추가된 updateProfile 메서드 구현
    @Override
    public boolean updateProfile(Member member) {
        int result = memberDao.updateMember(sqlSession, member); // DAO 메서드 재활용
        return result > 0;
    }
}

