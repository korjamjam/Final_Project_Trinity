package com.project.trinity.hospital.service;

import java.util.ArrayList;

import com.project.trinity.hospital.model.vo.HospitalInfo;

public interface HospitalService {

	HospitalInfo selectHospital(String hpId);

	ArrayList<HospitalInfo> selectHospitalList(String subject, String order);

}
