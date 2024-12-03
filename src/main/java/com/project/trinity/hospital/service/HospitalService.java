package com.project.trinity.hospital.service;

import java.util.ArrayList;

import com.project.trinity.hospital.model.vo.HospitalAccount;
import com.project.trinity.hospital.model.vo.HospitalInfo;

public interface HospitalService {

	HospitalInfo selectHospital(String hosNo);

	ArrayList<HospitalInfo> selectHospitalList(String subject, String order);
	
	ArrayList<HospitalInfo> selectHospitalListPaginated(String subject, String order, int page, int limit);

	HospitalAccount selectHospitalInfo(String hosNo);
	
	HospitalInfo selectHospitalOne(String hosNo);

	ArrayList<HospitalInfo> selectOpenHospitalList();

	ArrayList<HospitalInfo> selectOpenHospitalListPaginated(String subject, String order, int page, int limit);

	int insertHealthHospital(HospitalInfo hInfo);

	ArrayList<HospitalInfo> searchHospital(String keyword, String subject, String order, int page, int limit);

	HospitalInfo selectHosName(String hosName);

}
