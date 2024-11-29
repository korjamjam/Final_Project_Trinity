package com.project.trinity.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.trinity.member.model.vo.Member;
import com.project.trinity.member.model.vo.Rankup;

@Repository
public class AdminDao {

    public List<Member> getAllMembers(SqlSessionTemplate sqlSession) {
        return sqlSession.selectList("memberMapper.getAllMembers"); // MyBatis에서 모든 회원 조회 쿼리 실행
    }
    
    public List<Rankup> getAllRankups(SqlSessionTemplate sqlSession) {
        return sqlSession.selectList("memberMapper.getAllRankups"); // 네임스페이스 일치
    }

}
