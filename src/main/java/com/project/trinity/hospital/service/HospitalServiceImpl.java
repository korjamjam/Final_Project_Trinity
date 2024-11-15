package com.project.trinity.hospital.service;

import java.util.ArrayList;

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

	@Override
	public ArrayList<Hospital> selectHospitalList(String list_subject, String list_orderBy) {
		if(list_subject.equals("list_all")) {
			list_subject = "*";
		} 
		//병원 분류를 해야지 사용가능
//		else if(list_subject.equals("list_child")) {
//			list_subject = "소아과";
//		} else {
//			list_subject = "산부인과"; 
//		}
		
		if(list_orderBy.equals("relevant")) {
			list_orderBy = "";
		}
		return hpDao.selectHospitalList(sqlSession, list_subject, list_orderBy);
	}

	
}
