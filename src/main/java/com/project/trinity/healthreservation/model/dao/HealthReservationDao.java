package com.project.trinity.healthreservation.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
		 
		int r =	sqlSession.insert("healthReservationMapper.insertHealthReservation", healthReservation);
		System.out.println(r);
		System.out.println(healthReservation);
		return r;
	}

	
	
	
}
