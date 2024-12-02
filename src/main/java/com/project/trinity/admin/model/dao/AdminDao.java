
package com.project.trinity.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    
    public Rankup getRankupDetail(SqlSessionTemplate sqlSession, int seqNo) {
        return sqlSession.selectOne("memberMapper.getRankupDetail", seqNo);
    }
    
    public void updateMedKey(SqlSessionTemplate sqlSession, String userNo, String medKey) {
        Map<String, Object> params = new HashMap<>();
        params.put("userNo", userNo);
        params.put("medKey", medKey);
        sqlSession.update("memberMapper.updateMedKey", params);
    }

    public void updateRankupStatus(SqlSessionTemplate sqlSession, int seqNo, String status) {
        Map<String, Object> params = new HashMap<>();
        params.put("seqNo", seqNo);
        params.put("status", status);
        sqlSession.update("rankupMapper.updateRankupStatus", params);
    }


}
