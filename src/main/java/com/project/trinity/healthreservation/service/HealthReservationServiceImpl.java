package com.project.trinity.healthreservation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.trinity.healthreservation.model.dao.HealthReservationDao;
import com.project.trinity.reservation.model.vo.Reservation;

@Service
public class HealthReservationServiceImpl implements HealthReservationService {

    @Autowired
    private HealthReservationDao healthReservationDao;

    @Override
    public void saveReservation(Reservation reservation) {
        healthReservationDao.insertReservation(reservation);
    }
}
