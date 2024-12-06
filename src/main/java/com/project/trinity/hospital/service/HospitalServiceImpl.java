package com.project.trinity.hospital.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSessionManager;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.trinity.hospital.model.dao.HospitalDao;
import com.project.trinity.hospital.model.vo.HospitalAccount;
import com.project.trinity.hospital.model.vo.HospitalInfo;


@Service
public class HospitalServiceImpl implements HospitalService{

	@Autowired
    private SqlSessionTemplate sqlSession;
    
    @Autowired
    private HospitalDao hpDao;

	@Override
	public HospitalInfo selectHospital(String hosNo) {
		return hpDao.selectHospital(sqlSession, hosNo);
	}

	@Override
	public ArrayList<HospitalInfo> selectHospitalList(String subject, String order) {
        return hpDao.selectHospitalList(sqlSession, subject, order);
    }

	@Override
    public ArrayList<HospitalInfo> selectHospitalListPaginated(String subject, String order, int page, int limit) {
        int offset = (page - 1) * limit;
        System.out.println("Service page : " + page);
        System.out.println("Service offset : " + offset);
        System.out.println();
        return hpDao.selectHospitalListPaginated(sqlSession, subject, order, offset, limit);
    }

	@Override
	public HospitalInfo selectHospitalInfo(String hosNo) {
		return hpDao.selectHospitalInfo(sqlSession, hosNo);
	}

	@Override
	public ArrayList<HospitalInfo> selectOpenHospitalList() {
		return hpDao.selectOpenHospitalList(sqlSession);
	}

	@Override
	public ArrayList<HospitalInfo> selectOpenHospitalListPaginated(String subject, String order, int page, int limit) {
		int offset = (page - 1) * limit;
        System.out.println("Service page : " + page);
        System.out.println("Service offset : " + offset);
        System.out.println();
        return hpDao.selectOpenHospitalListPaginated(sqlSession, subject, order, offset, limit);
	}

	@Override
	public int insertHealthHospital(HospitalInfo hInfo) {
		return hpDao.insertHealthHospital(sqlSession, hInfo);
	}

	@Override
	public ArrayList<HospitalInfo> searchHospital(String keyword, String subject, String order, int page, int limit) {
		int offset = (page - 1) * limit;
		 System.out.println("Service page : " + page);
        System.out.println("Service offset : " + offset);
        System.out.println("Service keyword : " + keyword);
        System.out.println("Service subject : " + subject);
		return hpDao.searchHospital(sqlSession, subject, order, offset, limit, keyword);
	}

	@Override
	public HospitalInfo selectHosName(String hosName) {
		return hpDao.selectHosName(sqlSession, hosName);
	}

	@Override
	public int idCheck(String checkId) {
		return hpDao.idCheck(sqlSession, checkId);
	}

	@Override
	public int insertHospital(HospitalAccount hosAccount) {
		return hpDao.insertHospital(sqlSession, hosAccount);
	}

	@Override
	public HospitalAccount loginHosAccount(HospitalAccount hosAccount) {
		return hpDao.loginHosAccount(sqlSession, hosAccount);
	}

	
}
