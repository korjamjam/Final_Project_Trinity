package com.project.trinity.reservation.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.trinity.reservation.model.vo.Reservation;

@Repository
public class ReservationDao {

	@Autowired
    private SqlSession sqlSession;
	
	public int insertgReservation(String userNo, String hosNo, String resDate, String resTime,
			String subject, String content) {
		System.out.println(resDate);
		Map<String, String> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("HosNo", hosNo);
//		map.put("userName", userName);
//		map.put("birthday", birthday);
//		map.put("gender", gender);
		map.put("resDate", resDate);
		map.put("resTime", resTime);
		map.put("subject", subject);
		map.put("content", content);
		return sqlSession.insert("reservationMapper.insertgReservation", map);
	}

	public Reservation selectReservation(String resNo) {
		return sqlSession.selectOne("reservationMapper.selectReservation", resNo);
	}

}
