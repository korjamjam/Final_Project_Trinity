package com.project.trinity.reservation.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.trinity.member.model.vo.Guest;
import com.project.trinity.reservation.model.vo.GeneralReservation;
import com.project.trinity.reservation.model.vo.Reservation;

@Repository
public class ReservationDao {

	@Autowired
	private SqlSession sqlSession;

	public int insertgReservation(String userNo, String hosNo, String resDate, String resTime, String subject,
			String content) {
		Map<String, String> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("hosNo", hosNo);
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

	public GeneralReservation selectReservation(String resNo) {
		return sqlSession.selectOne("reservationMapper.selectReservation", resNo);
	}

	public Guest selectGuest(String phone, String email) {
		Map<String, String> map = new HashMap<>();
		map.put("phone", phone);
		map.put("email", email);

		Guest g = sqlSession.selectOne("reservationMapper.selectGuest", map);
		return g;
	}

	public int insertgGuestReservation(String hosNo, String guestNo, String userName, String birthday, String resDate,
			String resTime, String subject, String content, String gender) {
		Map<String, String> map = new HashMap<>();
		map.put("hosNo", hosNo);
		map.put("guestNo", guestNo);
		map.put("userName", userName);
		map.put("birthday", birthday);
		map.put("resDate", resDate);
		map.put("resTime", resTime);
		map.put("subject", subject);
		map.put("content", content);
		map.put("gender", gender);
		
		
		
		return sqlSession.insert("reservationMapper.insertgGuestReservation", map);
	}

	public List<Reservation> selectReservationsByUserNo(String userNo) {
	    System.out.println("DAO - userNo: " + userNo);
	    List<Reservation> reservations = sqlSession.selectList("reservationMapper.selectReservationsByUserNo", userNo);
	    System.out.println("DAO - reservations: " + reservations);
	    return reservations;
	}
	
	public int cancelReservation(String resNo) {
	    System.out.println("[DEBUG] DAO - 취소할 예약 번호: " + resNo);
	    int result = sqlSession.delete("reservationMapper.cancelReservation", resNo);
	    System.out.println("[DEBUG] DAO - 삭제 결과: " + result);
	    return result;
	}

	public ArrayList<Reservation> selectReservationHosNo(String hosNo) {
		return (ArrayList)sqlSession.selectList("reservationMapper.selectReservationHosNo", hosNo);
	}




}