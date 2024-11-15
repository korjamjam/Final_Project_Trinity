package com.project.trinity.hospital.service;

import java.util.ArrayList;

import com.project.trinity.hospital.model.vo.HospitalAccount;
import com.project.trinity.hospital.model.vo.HospitalInfo;

public interface HospitalService {

	HospitalInfo selectHospital(String hosNo);

	ArrayList<HospitalInfo> selectHospitalList(String subject, String order);

	HospitalAccount selectHospitalInfo(String hosNo);

}
