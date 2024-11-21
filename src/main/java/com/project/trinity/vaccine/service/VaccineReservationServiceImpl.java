package com.project.trinity.vaccine.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.trinity.hospital.model.vo.HospitalInfo;
import com.project.trinity.vaccine.model.dao.VaccineReservationDao;
import com.project.trinity.vaccine.model.vo.VaccineReservation;

@Service
public class VaccineReservationServiceImpl implements VaccineReservationService {

	@Autowired
    private SqlSessionTemplate sqlSession;

    @Autowired
    private VaccineReservationDao vaccineReservationDao;
    
    @Override
    public void insertReservation(VaccineReservation vaccineReservation) {
        vaccineReservationDao.insertReservation(sqlSession, vaccineReservation);
    }
    
    @Override
    public List<HospitalInfo> getAllHospitals() {
        List<HospitalInfo> hospitalList = vaccineReservationDao.getAllHospitals(sqlSession);
        System.out.println("디버그 - 서비스에서 가져온 병원 목록: " + hospitalList);
        return hospitalList;
    }
}
