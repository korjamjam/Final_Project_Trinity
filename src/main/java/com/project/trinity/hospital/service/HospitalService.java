package com.project.trinity.hospital.service;

import java.util.ArrayList;

import com.project.trinity.hospital.model.vo.Hospital;

public interface HospitalService {

	Hospital selectHospital(String hpId);

	ArrayList<Hospital> selectHospitalList(String subject, String order);

}
