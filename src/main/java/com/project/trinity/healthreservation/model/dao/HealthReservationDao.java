package com.project.trinity.healthreservation.model.dao;

import com.project.trinity.member.model.vo.Guest;
import com.project.trinity.reservation.model.vo.Reservation;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HealthReservationDao {

    @Autowired
    private SqlSession sqlSession;

    // 예약 정보를 DB에 삽입
    public void insertReservation(Reservation reservation) {
    	
    	// 디버깅: Reservation 객체 확인
        System.out.println("Service Layer - Reservation Data: " + reservation);
    	
        sqlSession.insert("reservationMapper.insertReservation", reservation);
    }

    // 예약 정보와 백신 종류 조회
    public Reservation selectReservationWithVaccine(int resNo) {
        return sqlSession.selectOne("reservationMapper.selectReservationWithVaccine", resNo);
    }

	public int insertGuest(Guest guest) {
		return sqlSession.insert("healthReservationMapper.insertGuest", guest);
	}
}
