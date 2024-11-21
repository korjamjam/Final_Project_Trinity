package com.project.trinity.healthreservation.service;

import com.project.trinity.member.model.vo.Guest;
import com.project.trinity.reservation.model.vo.HealthReservation;

public interface HealthReservationService {
	int insertGuest(Guest guest);

	int insertHealthReservation(HealthReservation healthReservation);

}
