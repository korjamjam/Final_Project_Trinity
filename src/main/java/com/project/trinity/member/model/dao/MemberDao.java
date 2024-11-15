package com.project.trinity.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.project.trinity.member.model.vo.Member;

@Repository
public class MemberDao {
    
    public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
        return sqlSession.selectOne("memberMapper.loginMember", m);
    }
    
    public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
        return sqlSession.selectOne("memberMapper.idCheck", checkId);
    }
    
    public int insertMember(SqlSessionTemplate sqlSession, Member m) {
        return sqlSession.insert("memberMapper.insertMember", m);
    }
    
    public int updateMember(SqlSessionTemplate sqlSession, Member m) {
        return sqlSession.update("memberMapper.updateMember", m);
    }
    
    public int deleteMember(SqlSessionTemplate sqlSession, String userId) {
        return sqlSession.update("memberMapper.deleteMember", userId);
    }
    
    // 새로운 메서드: userId로 사용자 정보를 조회
    public Member findByUserId(SqlSessionTemplate sqlSession, String userId) {
        return sqlSession.selectOne("memberMapper.findByUserId", userId);
    }
    
    
}
