package com.project.trinity.hospital.service;

import java.util.ArrayList;

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
	public HospitalAccount selectHospitalInfo(String hosNo) {
		return hpDao.selectHospitalInfo(sqlSession, hosNo);
	}

	@Override
	public HospitalInfo selectHospitalOne(String hosNo) {
		return hpDao.selectHospitalOne(sqlSession, hosNo);
	}

	@Override
	public ArrayList<HospitalInfo> searchHospital(String keyword) {
		return hpDao.searchHospital(sqlSession, keyword);
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

	
}
