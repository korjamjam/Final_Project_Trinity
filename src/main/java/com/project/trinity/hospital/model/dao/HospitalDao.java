package com.project.trinity.hospital.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.trinity.hospital.model.vo.HospitalAccount;
import com.project.trinity.hospital.model.vo.HospitalInfo;

@Repository
public class HospitalDao {

   public HospitalInfo selectHospital(SqlSessionTemplate sqlSession, String hosNo) {
      return sqlSession.selectOne("hospitalMapper.selectHospital", hosNo);
   }

   public ArrayList<HospitalInfo> selectHospitalList(SqlSessionTemplate sqlSession, String subject, String order) {
        Map<String, String> map = new HashMap<>();
        map.put("subject", subject);
        map.put("order", order);
        System.out.println(map);
        return (ArrayList)sqlSession.selectList("hospitalMapper.selectHospitalList", map);
    }

    public ArrayList<HospitalInfo> selectHospitalListPaginated(SqlSessionTemplate sqlSession, String subject, String order, int offset, int limit) {
        Map<String, Object> map = new HashMap<>();
        map.put("subject", subject.equals("listAll") ? "listAll" : "%" + subject + "%");
        map.put("order", order);
        map.put("offset", offset);
        map.put("limit", limit);
        
        return (ArrayList)sqlSession.selectList("hospitalMapper.selectHospitalListPaginated", map);
    }

   public HospitalAccount selectHospitalInfo(SqlSessionTemplate sqlSession, String hosNo) {
      return sqlSession.selectOne("hospitalMapper.selectHospitalInfo", hosNo);
   }

	public HospitalInfo selectHospitalOne(SqlSessionTemplate sqlSession, String hosNo) {
		return sqlSession.selectOne("hospitalMapper.selectHospital", hosNo);
	}

}
