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

   public ArrayList<HospitalInfo> selectHospitalList(SqlSessionTemplate sqlSession, String subject, String order) {
        Map<String, String> map = new HashMap<>();
        map.put("subject", subject);
        map.put("order", order);
        System.out.println(map);
        return (ArrayList)sqlSession.selectList("hospitalMapper.selectHospitalList", map);
    }

    public ArrayList<HospitalInfo> selectHospitalListPaginated(SqlSessionTemplate sqlSession, String subject, String order, int offset, int limit) {
        Map<String, Object> map = new HashMap<>();
        map.put("subject", subject);
        map.put("order", order);
        map.put("offset", offset);
        map.put("limit", limit);
        System.out.println("map : " + map);
        
        return (ArrayList)sqlSession.selectList("hospitalMapper.selectHospitalListPaginated", map);
    }

   public HospitalInfo selectHospitalInfo(SqlSessionTemplate sqlSession, String hosNo) {
      return sqlSession.selectOne("hospitalMapper.selectHospitalInfo", hosNo);
   }
   
	public ArrayList<HospitalInfo> selectOpenHospitalList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("hospitalMapper.selectOpenHospitalList");
	}

	public ArrayList<HospitalInfo> selectOpenHospitalListPaginated(SqlSessionTemplate sqlSession, String subject, String order, int offset, int limit) {
		Map<String, Object> map = new HashMap<>();
        map.put("subject", subject);
        map.put("order", order);
        map.put("offset", offset);
        map.put("limit", limit);
        
        return (ArrayList)sqlSession.selectList("hospitalMapper.selectOpenHospitalListPaginated", map);
	}

	public int insertHealthHospital(SqlSessionTemplate sqlSession, HospitalInfo hInfo) {
		return sqlSession.insert("hospitalMapper.insertHealthHospital", hInfo);
	}

	public ArrayList<HospitalInfo> searchHospital(SqlSessionTemplate sqlSession, String subject, String order,
			int offset, int limit, String keyword) {
		Map<String, Object> map = new HashMap<>();
		map.put("subject",subject);
		map.put("order", order);
        map.put("offset", offset);
        map.put("limit", limit);
		map.put("keyword",keyword);
		return (ArrayList)sqlSession.selectList("hospitalMapper.searchHospital", map);
	}

	public HospitalInfo selectHosName(SqlSessionTemplate sqlSession, String hosName) {
		return sqlSession.selectOne("hospitalMapper.selectHosName", hosName);
	}

	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("hospitalMapper.idCheck", checkId);
	}

	public int insertHospital(SqlSessionTemplate sqlSession, HospitalAccount hosAccount) {
		return sqlSession.insert("hospitalMapper.insertHospital", hosAccount);
	}

	public HospitalAccount loginHosAccount(SqlSessionTemplate sqlSession, HospitalAccount hosAccount) {
		return sqlSession.selectOne("hospitalMapper.loginHosAccount", hosAccount);
	}

}
