package com.project.trinity.hospital.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.trinity.hospital.model.vo.Hospital;

@Repository
public class HospitalDao {

	public Hospital selectHospital(SqlSessionTemplate sqlSession, String hpId) {
		return sqlSession.selectOne("hospitalMapper.selectHospital", hpId);
	}

	public ArrayList<Hospital> selectHospitalList(SqlSessionTemplate sqlSession, String subject, String order) {
		Map<String, String> map = new Map(subject, order);
		return sqlSession.selectMap("hospitalMapper.selectHospitalList", map);
	}

}
