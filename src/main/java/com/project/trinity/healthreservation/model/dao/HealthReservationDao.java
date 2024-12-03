package com.project.trinity.healthreservation.model.dao;

import java.util.ArrayList;

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

	public HealthReservation selectHealthReservation(String hResNo) {
		return sqlSession.selectOne("healthReservationMapper.selectHealthReservation", hResNo);
	}

	
	
	
}