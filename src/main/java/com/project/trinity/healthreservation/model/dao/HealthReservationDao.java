package com.project.trinity.healthreservation.model.dao;

import com.project.trinity.reservation.model.vo.Reservation;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HealthReservationDao {

    @Autowired
    private SqlSession sqlSession;

    public void insertReservation(Reservation reservation) {
        sqlSession.insert("reservationMapper.insertReservation", reservation);
    }
}
