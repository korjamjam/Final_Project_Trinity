package com.project.trinity.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.trinity.member.model.vo.MedicalField;
import com.project.trinity.member.model.vo.Member;
import com.project.trinity.member.model.vo.Rankup;

@Repository
public class AdminDao {

    public List<Member> getAllMembers(SqlSessionTemplate sqlSession) {
        return sqlSession.selectList("adminMapper.getAllMembers"); // MyBatis에서 모든 회원 조회 쿼리 실행
    }
    
    public List<Rankup> getAllRankups(SqlSessionTemplate sqlSession) {
        return sqlSession.selectList("adminMapper.getAllRankups"); // 네임스페이스 일치
    }
    
    public Rankup getRankupDetail(SqlSessionTemplate sqlSession, String seqNo) {
        return sqlSession.selectOne("adminMapper.getRankupDetail", seqNo);
    }
    
 // medical_field 테이블에 데이터 삽입
    public String insertMedicalField(SqlSessionTemplate sqlSession, String subject) {
        String medNo = sqlSession.selectOne("adminMapper.getNextMedNo");
        Map<String, Object> params = new HashMap<>();
        params.put("medNo", medNo);
        params.put("subject", subject);

        sqlSession.insert("adminMapper.insertMedicalField", params);

        // 삽입된 MED_NO가 유효한지 검증
        Integer count = sqlSession.selectOne("adminMapper.checkMedicalFieldExists", medNo);
        if (count == null || count == 0) {
            throw new RuntimeException("MEDICAL_FIELD 삽입 실패: " + medNo);
        }

        return medNo;
    }


 // member 테이블의 med_key 업데이트
    public int updateMemberMedKey(SqlSessionTemplate sqlSession, String medNo, String userNo) {
        Map<String, String> params = new HashMap<>();
        params.put("medNo", medNo); // Member의 medKey는 MedicalField의 medNo와 동일
        params.put("userNo", userNo);

        return sqlSession.update("adminMapper.updateMemberMedKey", params);
    }
    
 // RANKUP 상태 업데이트 메서드
    public void updateRankupStatus(SqlSessionTemplate sqlSession, String seqNo, String status) {
        Map<String, Object> params = new HashMap<>();
        params.put("seqNo", seqNo);
        params.put("status", status);
        sqlSession.update("adminMapper.updateRankupStatus", params);
    }
    
    
    
    public String getLastInsertedMedNo(SqlSessionTemplate sqlSession) {
        return sqlSession.selectOne("adminMapper.getLastInsertedMedNo");
    }
    
 // medical_field 데이터 삭제
    public void deleteMedicalFieldByMedNo(SqlSessionTemplate sqlSession, String medNo) {
        sqlSession.delete("adminMapper.deleteMedicalFieldByMedKey", medNo); // 삭제할 때 medNo를 사용
    }

    /// member 테이블에서 med_key를 null로 업데이트
    public void resetMemberMedKey(SqlSessionTemplate sqlSession, String userNo) {
        sqlSession.update("adminMapper.resetMemberMedKey", userNo); // Member의 medKey를 null로
    }
    
    public String getMedKeyBySeqNo(SqlSessionTemplate sqlSession, String seqNo) {
        return sqlSession.selectOne("adminMapper.getMedKeyBySeqNo", seqNo);
    }
    
 // medical_field 데이터 가져오기
    public MedicalField getMedicalFieldByMedNo(SqlSessionTemplate sqlSession, String medNo) {
        return sqlSession.selectOne("adminMapper.getMedicalFieldByMedKey", medNo); // MedicalField의 medNo 기반 검색
    }
    
 // Member 테이블에서 medKey가 null로 설정될 때 관련된 medical_field 데이터 삭제
    public void deleteMedicalFieldIfMedKeyIsNull(SqlSessionTemplate sqlSession, String userNo) {
        String medKey = sqlSession.selectOne("adminMapper.getMedKeyByUserNo", userNo);
        System.out.println("Retrieved medKey for userNo " + userNo + ": " + medKey); // 로그 추가
        if (medKey != null) {
            int rowsDeleted = sqlSession.delete("adminMapper.deleteMedicalFieldByMedKey", medKey);
            System.out.println("Rows deleted from MEDICAL_FIELD: " + rowsDeleted); // 삭제된 행 수 로그
        }
    }

    
    


}
