package com.project.trinity.vaccine.service;

import java.util.List;

import com.project.trinity.hospital.model.vo.HospitalInfo;
import com.project.trinity.member.model.vo.Guest;
import com.project.trinity.vaccine.model.vo.VaccineReservation;

public interface VaccineReservationService {

    /**
     * 예약 정보를 데이터베이스에 삽입하는 메서드
     *
     * @param vaccineReservation 예약 정보가 담긴 VaccineReservation 객체
     */
    void insertReservation(VaccineReservation vaccineReservation); // 예약 삽입

    /**
     * 모든 병원 목록을 조회하는 메서드
     *
     * @return 병원 정보가 담긴 HospitalInfo 객체의 리스트
     */
    List<HospitalInfo> getAllHospitals(); // 병원 목록 조회
    
    String insertGuest(Guest guest); // 비회원 정보를 삽입하고 GST_NO 반환
}
