package com.project.trinity.healthreservation.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.trinity.healthreservation.model.dao.HealthReservationDao;
import com.project.trinity.member.model.vo.Guest;
import com.project.trinity.member.model.vo.Member;

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

		
}
