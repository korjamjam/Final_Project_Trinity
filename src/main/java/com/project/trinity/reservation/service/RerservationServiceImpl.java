package com.project.trinity.reservation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.trinity.reservation.model.dao.ReservationDao;

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

}
