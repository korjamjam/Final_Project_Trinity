package com.project.trinity.reservation.service;

import com.project.trinity.reservation.model.vo.GeneralReservation;
import com.project.trinity.reservation.model.vo.Reservation;

public interface ReservationService {

	int insertgReservation(String userNo, String hosNo, String resDate, String resTime, String subject, String content);

	int insertgGuest(String userName, String birthday, String phone, String email, String gender);
	
	GeneralReservation selectReservation(String resNo);

}
