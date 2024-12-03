package com.project.trinity.healthreservation.service;

import java.util.List;

import com.project.trinity.hospital.model.vo.HospitalInfo;
import com.project.trinity.member.model.vo.Guest;
import com.project.trinity.reservation.model.vo.HealthReservation;

public interface HealthReservationService {

    // 게스트 정보 삽입
    int insertGuest(Guest guest);

    // 건강검진 예약 삽입
    int insertHealthReservation(HealthReservation healthReservation);

    // 병원 리스트 조회
    List<HospitalInfo> getHospitalList();

    // 특정 예약 번호로 건강검진 예약 조회
    HealthReservation getHealthReservation(String hResNo);

    // 특정 사용자 번호로 건강검진 예약 리스트 조회
    List<HealthReservation> getHealthReservationsByUserNo(String userNo);
}
