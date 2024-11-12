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
}
