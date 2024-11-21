package com.project.trinity.reservation.service;

import java.sql.Date;

public interface ReservationService {

	int insertgReservation(String userNo, String hosNo, Date resDate, String resTime, String subject, String content);

}
