package com.project.trinity.admin.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.trinity.admin.model.dao.AdminDao;
import com.project.trinity.community.model.vo.Community;
import com.project.trinity.hospital.model.vo.HospitalInfo;
import com.project.trinity.member.model.vo.Member;
import com.project.trinity.member.model.vo.Rankup;
import com.project.trinity.reservation.model.vo.Reservation;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Autowired
    private AdminDao adminDao;

    @Override
    public List<Member> getAllMembers() {
        List<Member> members = adminDao.getAllMembers(sqlSession);
        return members;
    }
    
    @Override
    public List<Member> getMembersByRole(String role) {
        return adminDao.getMembersByRole(sqlSession, role);
    }
    
    @Override
    public Member getMemberDetail(String userNo) {
        return adminDao.getMemberDetail(sqlSession, userNo);
    }
    
    @Override
    public boolean  updateMember(Member member) {
    	int result = adminDao.updateMember(sqlSession, member);
    	return result > 0; 
    }
    
    @Override
    public List<Rankup> getAllRankups() {
        return adminDao.getAllRankups(sqlSession);
    }
    
    @Override
    public Rankup getRankupDetail(String seqNo) {
        return adminDao.getRankupDetail(sqlSession, seqNo);
    }
    
    @Override
    public void setRankupToWaiting(String seqNo) {
        // RANKUP 상태를 'W'(대기)로 업데이트
        adminDao.updateRankupStatus(sqlSession, seqNo, "W");
    }
    
    @Override
    public void approveRankup(String seqNo) {
        Rankup rankup = adminDao.getRankupDetail(sqlSession, seqNo);
        if (rankup != null && rankup.getUserNo() != null) {
            // MEDICAL_FIELD 데이터 삽입
            String newMedNo = adminDao.insertMedicalField(sqlSession, rankup.getSubject());

            // MEMBER 테이블 업데이트
            adminDao.updateMemberMedKey(sqlSession, newMedNo, rankup.getUserNo());

            // RANKUP 상태 업데이트
            adminDao.updateRankupStatus(sqlSession, seqNo, "A");
        }
    }

    @Override
    public void rejectRankup(String seqNo) {
        Rankup rankup = adminDao.getRankupDetail(sqlSession, seqNo);
        if (rankup != null && rankup.getUserNo() != null) {
            // MEMBER 테이블의 medKey를 null로 설정
            adminDao.resetMemberMedKey(sqlSession, rankup.getUserNo());

            // medKey가 null인 경우 관련된 medical_field 데이터 삭제
            adminDao.deleteMedicalFieldIfMedKeyIsNull(sqlSession, rankup.getUserNo());

            // RANKUP 상태를 'D'(거부)로 업데이트
            adminDao.updateRankupStatus(sqlSession, seqNo, "D");
        }
    }
    
    //---------------------------------병원관리---------------------------------
    
    @Override
    public List<HospitalInfo> getAllHospitals() {
        return adminDao.getAllHospitals(sqlSession);
    }
    
    @Override
    public List<HospitalInfo> getHospitalsByDepartment(String department) {
        return adminDao.getHospitalsByDepartment(sqlSession, department);
    }


	@Override
	public HospitalInfo getHospitalDetail(String hosNo) {
		return adminDao.getHospitalDetail(sqlSession, hosNo);
	}
	
	@Override
	public boolean updateHospital(HospitalInfo hospital) {
	    int infoResult = adminDao.updateHospitalInfo(sqlSession, hospital);
	    int accountResult = adminDao.updateHospitalAccount(sqlSession, hospital);
	    return infoResult > 0 && accountResult > 0; // 두 업데이트가 모두 성공해야 true 반환
	}
	
	//---------------------------------예약 관리---------------------------------
	@Override
	public List<Reservation> getAllReservations() {
	    return adminDao.getAllReservations(sqlSession);
	}
	
	@Override
    public Map<String, Object> getReservationDetail(String reservationNo) {
        return adminDao.getReservationDetail(sqlSession, reservationNo);
    }
	
	//---------------------------------게시글 관리---------------------------------
	@Override
    public List<Community> getAllPosts() {
        return adminDao.getAllPosts(sqlSession);
    }

	
}