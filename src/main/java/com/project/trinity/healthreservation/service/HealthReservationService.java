package com.project.trinity.healthreservation.service;

import java.util.ArrayList;

import com.project.trinity.hospital.model.vo.HospitalInfo;
import com.project.trinity.member.model.vo.Guest;
import com.project.trinity.reservation.model.vo.HealthReservation;

public interface HealthReservationService {
	int insertGuest(Guest guest);

	int insertHealthReservation(HealthReservation healthReservation);

	ArrayList<HospitalInfo> selectHospitalList();

}
