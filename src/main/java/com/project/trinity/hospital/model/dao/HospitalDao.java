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

	public HospitalInfo selectHospital(SqlSessionTemplate sqlSession, String hosNo) {
		HospitalInfo h = sqlSession.selectOne("hospitalMapper.selectHospital", hosNo);
		System.out.println(h);
		return h;
	}

	public ArrayList<HospitalInfo> selectHospitalList(SqlSessionTemplate sqlSession, String subject, String order) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("subject", subject);
		map.put("order", order);
		System.out.println(map);
		ArrayList<HospitalInfo> list = (ArrayList)sqlSession.selectList("hospitalMapper.selectHospitalList", map);
		return list;
	}

}
