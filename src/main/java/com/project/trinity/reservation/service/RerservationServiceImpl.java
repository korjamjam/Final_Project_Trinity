package com.project.trinity.reservation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		int result = rDao.insertgReservation(userNo, hosNo, resDate, resTime, subject, content);
		return result;
	}

	@Override
	public GeneralReservation selectReservation(String resNo) {
		return rDao.selectReservation(resNo);
	}


}
