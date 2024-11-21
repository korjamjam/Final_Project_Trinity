package com.project.trinity.healthreservation.model.dao;

import com.project.trinity.healthreservation.model.vo.HealthReservation;
import com.project.trinity.member.model.vo.Guest;
import com.project.trinity.member.model.vo.Member;
import com.project.trinity.reservation.model.vo.Reservation;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
