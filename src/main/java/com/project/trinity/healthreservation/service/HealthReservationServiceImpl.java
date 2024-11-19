package com.project.trinity.healthreservation.service;

import com.project.trinity.healthreservation.model.dao.HealthReservationDao;
import com.project.trinity.member.model.vo.Guest;
import com.project.trinity.reservation.model.vo.Reservation;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public String selectGuest(String gstName, String gstPhone) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("gstName", gstName);
		map.put("gstPhone", gstPhone);
		return healthReservationDao.selectGuest(map);
	}
}
