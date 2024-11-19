package com.project.trinity.healthreservation.service;

import com.project.trinity.member.model.vo.Guest;
import com.project.trinity.reservation.model.vo.Reservation;

public interface HealthReservationService {
    void saveReservation(Reservation reservation);
    Reservation getReservationWithVaccine(int resNo);
	int insertGuest(Guest guest);
	String selectGuest(String gstName, String gstPhone);
}
