package com.project.trinity.healthreservation.service;

import java.util.ArrayList;

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
	public HealthReservation selectHealthReservation(String hResNo) {
		return healthReservationDao.selectHealthReservation(hResNo);
	}

		
}