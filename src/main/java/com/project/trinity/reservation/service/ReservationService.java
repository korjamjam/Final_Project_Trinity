package com.project.trinity.reservation.service;

import com.project.trinity.reservation.model.vo.GeneralReservation;
import com.project.trinity.reservation.model.vo.Reservation;

public interface ReservationService {

	int insertgReservation(String userNo, String hosNo, String resDate, String resTime, String subject, String content);

	GeneralReservation selectReservation(String resNo);


}
