package com.project.trinity.reservation.service;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.trinity.reservation.model.dao.ReservationDao;

@Service
public class RerservationServiceImpl implements ReservationService{

	@Autowired
	private ReservationDao rDao;

	@Override
	public int insertgReservation(String userNo, String hosNo, Date resDate, String resTime,
			String subject, String content) {
		int result = rDao.insertgReservation(userNo, hosNo, resDate, resTime, subject, content);
		return result;
	}

}
