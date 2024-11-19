package com.project.trinity.vaccine.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.trinity.reservation.model.vo.Reservation;

@Repository
public class VaccineReservationDao {

    @Autowired
    private SqlSession sqlSession;

    // 예약 정보를 DB에 삽입
    public void insertReservation(Reservation reservation) {
    	
    }
}