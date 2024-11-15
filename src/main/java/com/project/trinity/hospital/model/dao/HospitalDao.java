package com.project.trinity.hospital.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.trinity.hospital.model.vo.Hospital;

@Repository
public class HospitalDao {

	public Hospital selectHospital(SqlSessionTemplate sqlSession, String hpId) {
		return sqlSession.selectOne("hospitalMapper.selectHospital", hpId);
	}

	public ArrayList<Hospital> selectHospitalList(SqlSessionTemplate sqlSession, String list_subject,
			String list_orderBy) {
		Map<String, String> list = new HashMap<>();
		list.put("list_subject", list_subject);
		list.put("list_orderBy", list_orderBy);
		return (ArrayList)sqlSession.selectList("hospitalMapper.selectHospitalList", list);
	}

}
