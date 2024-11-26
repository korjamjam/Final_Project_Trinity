package com.project.trinity.reservation.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReservationDao {

	@Autowired
    private SqlSession sqlSession;
	
	public int insertgReservation(String userNo, String hosNo, String resDate, String resTime,
			String subject, String content) {
		Map<String, String> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("hosNo", hosNo);
//		map.put("userName", userName);
//		map.put("birthday", birthday);
//		map.put("gender", gender);
		map.put("resDate", resDate);
		map.put("resTime", resTime);
		map.put("subject", subject);
		map.put("content", content);
		return sqlSession.insert("reservationMapper.insertgReservation", map);
	}

	public int insertgGuest(String userName, String birthday, String phone, String email, String gender) {
		Map<String, String> map = new HashMap<>();
		map.put("userName", userName);
		map.put("birthday", birthday);
		map.put("phone", phone);
		map.put("email", email);
		map.put("gender", gender);
		return sqlSession.insert("reservationMapper.insertgGuest", map);
	}

}
