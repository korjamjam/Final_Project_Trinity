package com.project.trinity.healthreservation.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.trinity.healthreservation.model.dao.HealthReservationDao;
import com.project.trinity.hospital.model.vo.HospitalInfo;
import com.project.trinity.member.model.vo.Guest;
import com.project.trinity.reservation.model.vo.HealthReservation;

@Service
public class HealthReservationServiceImpl implements HealthReservationService {

    @Autowired	
    private HealthReservationDao healthReservationDao;

    @Autowired
    private SqlSession sqlSession;

	@Override
	public int insertGuest(Guest guest) {
		return healthReservationDao.insertGuest(guest);
	}

	@Override
	public int insertHealthReservation(HealthReservation healthReservation) {
		return healthReservationDao.insertHealthReservation(healthReservation);
	}

	@Override
	public ArrayList<HospitalInfo> selectHospitalList() {
		return healthReservationDao.selectHospitalList();
	}

	@Override
	public HealthReservation selectHealthReservation(String healthResNo) {
		return healthReservationDao.selectHealthReservation(healthResNo);
	}
	
	@Override
	public List<HealthReservation> getHealthReservationsByUserNo(String userNo) {
	    return healthReservationDao.selectHealthReservationsByUserNo(userNo);
	}

	@Override
	public int cancelHealthReservation(String healthResNo) {
	    return healthReservationDao.cancelHealthReservation(healthResNo);
	}

	
		
}