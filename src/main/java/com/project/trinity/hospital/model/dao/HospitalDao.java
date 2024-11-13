package com.project.trinity.hospital.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.project.trinity.hospital.model.vo.Hospital;

public class HospitalDao {

	public Hospital selectHospital(SqlSessionTemplate sqlSession, String hpId) {
		return sqlSession.selectOne("hospitalMapper.selectHospital", hpId);
	}

}
