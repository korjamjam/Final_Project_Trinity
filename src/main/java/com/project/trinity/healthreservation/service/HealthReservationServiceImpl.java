package com.project.trinity.healthreservation.service;

import com.project.trinity.healthreservation.model.dao.HealthReservationDao;
import com.project.trinity.reservation.model.vo.Reservation;
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
    public void saveReservation(Reservation reservation) {
        healthReservationDao.insertReservation(reservation);
    }

    @Override
    public Reservation getReservationWithVaccine(int resNo) {
        return healthReservationDao.selectReservationWithVaccine(resNo);
    }
}
