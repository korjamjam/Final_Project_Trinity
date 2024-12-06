package com.project.trinity.reservation.service;

import java.util.ArrayList;
import java.util.List;

import com.project.trinity.member.model.vo.Guest;
import com.project.trinity.reservation.model.vo.GeneralReservation;
import com.project.trinity.reservation.model.vo.Reservation;

public interface ReservationService {

	int insertgReservation(String userNo, String hosNo, String resDate, String resTime, String subject, String content);

	int insertgGuest(String userName, String birthday, String phone, String email, String gender);
	
	GeneralReservation selectReservation(String resNo);

	Guest selectGuest(String phone, String email);

	int insertgGuestReservation(String hosNo, String guestNo, String userName, String birthday, String resDate,
			String resTime, String subject, String content, String gender);
	
	// ReservationService
	List<Reservation> getReservationsByUserNo(String userNo);

	int cancelReservation(String resNo);

	ArrayList<Reservation> selectReservationHosNo(String hosNo);

	

}