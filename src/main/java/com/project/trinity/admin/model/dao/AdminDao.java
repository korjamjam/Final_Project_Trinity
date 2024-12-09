
package com.project.trinity.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.trinity.community.board.model.vo.Board;
import com.project.trinity.hospital.model.vo.HospitalInfo;
import com.project.trinity.member.model.vo.Member;
import com.project.trinity.member.model.vo.Rankup;
import com.project.trinity.reservation.model.vo.Reservation;

@Repository
public class AdminDao {

	//------------------------------------회원관리 페이지------------------------------------
    public List<Member> getAllMembers(SqlSessionTemplate sqlSession) {
        return sqlSession.selectList("adminMapper.getAllMembers"); // MyBatis에서 모든 회원 조회 쿼리 실행
    }
    
    public List<Member> getMembersByRole(SqlSessionTemplate sqlSession, String role) {
        return sqlSession.selectList("adminMapper.getMembersByRole", role);
    }
    
    public Member getMemberDetail(SqlSessionTemplate sqlSession, String userNo) {
        return sqlSession.selectOne("adminMapper.getMemberDetail", userNo);
    }
    
    public int updateMember(SqlSessionTemplate sqlSession, Member member) {
    	return sqlSession.update("adminMapper.updateMember", member);
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

    /// member 테이블에서 med_key를 null로 업데이트
    public void resetMemberMedKey(SqlSessionTemplate sqlSession, String userNo) {
        sqlSession.update("adminMapper.resetMemberMedKey", userNo); // Member의 medKey를 null로
    }
    
 // Member 테이블에서 medKey가 null로 설정될 때 관련된 medical_field 데이터 삭제
    public void deleteMedicalFieldIfMedKeyIsNull(SqlSessionTemplate sqlSession, String userNo) {
        String medKey = sqlSession.selectOne("adminMapper.getMedKeyByUserNo", userNo);
        if (medKey != null) {
            int rowsDeleted = sqlSession.delete("adminMapper.deleteMedicalFieldByMedKey", medKey);
        }
    }
    
    //-------------------------------병원 관리-------------------------------
    
    public List<HospitalInfo> getAllHospitals(SqlSessionTemplate sqlSession) {
        return sqlSession.selectList("adminMapper.getAllHospitals");
    }
    
    public List<HospitalInfo> getHospitalsByDepartment(SqlSessionTemplate sqlSession, String department) {
        return sqlSession.selectList("adminMapper.getHospitalsByDepartment", department);
    }

    
    public HospitalInfo getHospitalDetail(SqlSessionTemplate sqlSession, String hosNo) {
        return sqlSession.selectOne("adminMapper.getHospitalDetail", hosNo); // hosNo에 따라 조회
    }
    
    public int updateHospitalInfo(SqlSessionTemplate sqlSession, HospitalInfo hospital) {
        return sqlSession.update("adminMapper.updateHospitalInfo", hospital);
    }

    public int updateHospitalAccount(SqlSessionTemplate sqlSession, HospitalInfo hospital) {
        return sqlSession.update("adminMapper.updateHospitalAccount", hospital);
    }
    
    //-------------------------------예약 관리-------------------------------
    
    public List<Reservation> getAllReservations(SqlSessionTemplate sqlSession) {
        return sqlSession.selectList("adminMapper.getAllReservations");
    }
    
  //-------------------------------게시글 관리-------------------------------
    public List<Board> getAllPosts(SqlSessionTemplate sqlSession) {
        return sqlSession.selectList("adminMapper.getAllPosts");
    }
    
}