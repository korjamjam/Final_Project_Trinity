package com.project.trinity.hospital.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.trinity.hospital.model.dao.HospitalDao;
import com.project.trinity.hospital.model.vo.HospitalInfo;


@Service
public class HospitalServiceImpl implements HospitalService{

	@Autowired
    private SqlSessionTemplate sqlSession;
    
    @Autowired
    private HospitalDao hpDao;

	@Override
	public HospitalInfo selectHospital(String hpId) {
		return hpDao.selectHospital(sqlSession, hpId);
	}

	@Override
	public ArrayList<HospitalInfo> selectHospitalList(String subject, String order) {
		return hpDao.selectHospitalList(sqlSession, subject, order);
	}

	
}
