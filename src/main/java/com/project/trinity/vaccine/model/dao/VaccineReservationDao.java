package com.project.trinity.vaccine.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.trinity.hospital.model.vo.HospitalInfo;
import com.project.trinity.vaccine.model.vo.VaccineReservation;

@Repository
public class VaccineReservationDao {

    /**
     * 예약 정보를 DB에 삽입하는 메서드
     * 
     * @param sqlSession         MyBatis의 SqlSessionTemplate 객체
     * @param vaccineReservation 예약 정보가 담긴 VaccineReservation 객체
     */
    public void insertReservation(SqlSessionTemplate sqlSession, VaccineReservation vaccineReservation) {
        // MyBatis Mapper를 호출하여 예약 정보를 데이터베이스에 삽입
        sqlSession.insert("vaccineMapper.insertVaccineReservation", vaccineReservation);
    }
    
    /**
     * 모든 병원 정보를 DB에서 조회하는 메서드
     * 
     * @param sqlSession MyBatis의 SqlSessionTemplate 객체
     * @return 병원 정보가 담긴 HospitalInfo 객체의 리스트
     */
    public List<HospitalInfo> getAllHospitals(SqlSessionTemplate sqlSession) {
        // MyBatis Mapper를 호출하여 병원 목록을 데이터베이스에서 조회
        List<HospitalInfo> hospitalList = sqlSession.selectList("vaccineMapper.selectAllHospitals");
        // 조회된 병원 목록 반환
        return hospitalList;
    }
}
