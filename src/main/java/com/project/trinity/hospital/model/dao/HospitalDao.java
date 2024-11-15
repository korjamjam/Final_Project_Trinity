package com.project.trinity.hospital.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.trinity.hospital.model.vo.Hospital;

@Repository
public class HospitalDao {

	public ArrayList<Hospital> selectHospitalList(SqlSessionTemplate sqlSession, String subject, String order) {
		// TODO Auto-generated method stub
		return null;
	}

}
