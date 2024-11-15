package com.project.trinity.hospital.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.trinity.hospital.model.vo.HospitalInfo;

@Repository
public class HospitalDao {

	public HospitalInfo selectHospital(SqlSessionTemplate sqlSession, String hpId) {
		return sqlSession.selectOne("hospitalMapper.selectHospital", hpId);
	}

	public ArrayList<HospitalInfo> selectHospitalList(SqlSessionTemplate sqlSession, String subject, String order) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("subject", subject);
		map.put("order", order);
		
		return (ArrayList)sqlSession.selectList("hospitalMapper.selectHospitalList", map);
	}

}
