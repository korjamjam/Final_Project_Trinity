package com.project.trinity.reservation.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.trinity.member.model.vo.Guest;
import com.project.trinity.reservation.model.dao.ReservationDao;
import com.project.trinity.reservation.model.vo.GeneralReservation;
import com.project.trinity.reservation.model.vo.Reservation;

@Service
public class RerservationServiceImpl implements ReservationService{

	@Autowired
	private ReservationDao rDao;

	@Override
	public int insertgReservation(String userNo, String hosNo, String resDate, String resTime,
			String subject, String content) {
		String month = resDate.substring(0, 2);
		String day = resDate.substring(3, 5);
		String year = resDate.substring(6, 10);
		resDate = year + "-" + month + "-" + day;
		return rDao.insertgReservation(userNo, hosNo, resDate, resTime, subject, content);
	}

	@Override
	public int insertgGuest(String userName, String birthday, String phone, String email, String gender) {
		return rDao.insertgGuest(userName, birthday, phone, email, gender);
	}


	@Override
	public Guest selectGuest(String phone, String email) {
		return rDao.selectGuest(phone, email);
	}

	@Override
	public int insertgGuestReservation(String hosNo, String guestNo, String userName, String birthday, String resDate,
			String resTime, String subject, String content, String gender) {
		String month = resDate.substring(0, 2);
		String day = resDate.substring(3, 5);
		String year = resDate.substring(6, 10);
		resDate = year + "-" + month + "-" + day;
		return rDao.insertgGuestReservation(hosNo, guestNo, userName, birthday, resDate, resTime, subject, content, gender);
	}
	
	// ReservationServiceImpl
	@Override
	public List<Reservation> getReservationsByUserNo(String userNo) {
	    return rDao.selectReservationsByUserNo(userNo);
	}
	
	@Override
	public int cancelReservation(String resNo) {
	    System.out.println("[DEBUG] Service - 취소할 예약 번호: " + resNo);
	    int result = rDao.cancelReservation(resNo);
	    System.out.println("[DEBUG] Service - 취소 결과: " + result);
	    return result;
	}

	@Override
	public ArrayList<Reservation> selectReservationHosNo(String hosNo) {
		return rDao.selectReservationHosNo(hosNo);
	}



}