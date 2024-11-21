package com.project.trinity.vaccine.service;

import java.util.List;

import com.project.trinity.hospital.model.vo.HospitalInfo;
import com.project.trinity.vaccine.model.vo.VaccineReservation;

public interface VaccineReservationService {
	void insertReservation(VaccineReservation vaccineReservation); // 예약 삽입
    List<HospitalInfo> getAllHospitals(); // 병원 목록 조회
}
