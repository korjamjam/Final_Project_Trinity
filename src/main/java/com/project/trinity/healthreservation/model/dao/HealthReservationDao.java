package com.project.trinity.healthreservation.model.dao;

import java.util.ArrayList;
import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.trinity.hospital.model.vo.HospitalInfo;
import com.project.trinity.member.model.vo.Guest;
import com.project.trinity.reservation.model.vo.HealthReservation;

@Repository
public class HealthReservationDao {

    @Autowired
    private SqlSession sqlSession;

	public int insertGuest(Guest guest) {
		return sqlSession.insert("healthReservationMapper.insertGuest", guest);
	}

	public int insertHealthReservation(HealthReservation healthReservation) {
		return sqlSession.insert("healthReservationMapper.insertHealthReservation", healthReservation);
	}

	public ArrayList<HospitalInfo> selectHospitalList() {
		return (ArrayList)sqlSession.selectList("healthReservationMapper.selectHospitalList");
	}

	public HealthReservation selectHealthReservation(String healthResNo) {
		return sqlSession.selectOne("healthReservationMapper.selectHealthReservation", healthResNo);
	}

	public List<HealthReservation> selectHealthReservationsByUserNo(String userNo) {
	    return sqlSession.selectList("healthReservationMapper.selectHealthReservationsByUserNo", userNo);
	}

	public int selectHosName(String hosName) {
		return sqlSession.selectOne("healthReservationMapper.selectHosName", hosName);
	}

	public int cancelHealthReservation(String healthResNo) {
	    return sqlSession.delete("healthReservationMapper.cancelHealthReservation", healthResNo);
	}

	
	
	
}