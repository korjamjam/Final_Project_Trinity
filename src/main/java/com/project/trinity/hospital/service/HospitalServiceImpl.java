package com.project.trinity.hospital.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.trinity.hospital.model.dao.HospitalDao;
import com.project.trinity.hospital.model.vo.Hospital;


@Service
public class HospitalServiceImpl implements HospitalService{

	@Autowired
    private SqlSessionTemplate sqlSession;
    
    @Autowired
    private HospitalDao hpDao;

	@Override
	public Hospital selectHospital(String hpId) {
		return hpDao.selectHospital(sqlSession, hpId);
	}
    
    
}
