package com.project.trinity.healthreservation.service;

import com.project.trinity.healthreservation.model.vo.HealthReservation;
import com.project.trinity.member.model.vo.Guest;
import com.project.trinity.member.model.vo.Member;
import com.project.trinity.reservation.model.vo.Reservation;

public interface HealthReservationService {
	int insertGuest(Guest guest);

	int insertHealthReservation(HealthReservation healthReservation);

}
