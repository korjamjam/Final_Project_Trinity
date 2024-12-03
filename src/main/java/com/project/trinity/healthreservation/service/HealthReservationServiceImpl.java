package com.project.trinity.healthreservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.trinity.healthreservation.model.dao.HealthReservationDao;
import com.project.trinity.hospital.model.vo.HospitalInfo;
import com.project.trinity.member.model.vo.Guest;
import com.project.trinity.reservation.model.vo.HealthReservation;

@Service
public class HealthReservationServiceImpl implements HealthReservationService {

    private final HealthReservationDao hReservationDao;

    @Autowired
    public HealthReservationServiceImpl(HealthReservationDao hReservationDao) {
        this.hReservationDao = hReservationDao;
    }

    @Override
    public int insertGuest(Guest guest) {
        return hReservationDao.insertGuest(guest);
    }

    @Override
    public int insertHealthReservation(HealthReservation healthReservation) {
        return hReservationDao.insertHealthReservation(healthReservation);
    }

    @Override
    public List<HospitalInfo> getHospitalList() {
        return hReservationDao.selectHospitalList();
    }

    @Override
    public HealthReservation getHealthReservation(String hResNo) {
        return hReservationDao.selectHealthReservation(hResNo);
    }

    @Override
    public List<HealthReservation> getHealthReservationsByUserNo(String userNo) {
        return hReservationDao.selectHealthReservationsByUserNo(userNo);
    }
}
