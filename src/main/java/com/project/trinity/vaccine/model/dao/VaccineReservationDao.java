package com.project.trinity.vaccine.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.trinity.hospital.model.vo.HospitalInfo;
import com.project.trinity.vaccine.model.vo.VaccineReservation;

@Repository
public class VaccineReservationDao {

    // 예약 정보를 DB에 삽입
    public void insertReservation(SqlSessionTemplate sqlSession, VaccineReservation vaccineReservation) {
        sqlSession.insert("vaccineMapper.insertVaccineReservation", vaccineReservation);
    }
    
 // 병원 목록 조회
    public List<HospitalInfo> getAllHospitals(SqlSessionTemplate sqlSession) {
        List<HospitalInfo> hospitalList = sqlSession.selectList("vaccineMapper.selectAllHospitals");
        System.out.println("디버그 - DAO에서 가져온 병원 목록: " + hospitalList); //디버그 체크용
        return hospitalList;
    }
}