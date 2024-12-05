package com.project.trinity.healthreservation.service;

import java.util.ArrayList;
import java.util.List;

import com.project.trinity.hospital.model.vo.HospitalInfo;
import com.project.trinity.member.model.vo.Guest;
import com.project.trinity.reservation.model.vo.HealthReservation;

public interface HealthReservationService {
	int insertGuest(Guest guest);

	int insertHealthReservation(HealthReservation healthReservation);

	ArrayList<HospitalInfo> selectHospitalList();

	HealthReservation selectHealthReservation(String healthResNo);
	
	List<HealthReservation> getHealthReservationsByUserNo(String userNo);
	
	int cancelHealthReservation(String healthResNo);

}