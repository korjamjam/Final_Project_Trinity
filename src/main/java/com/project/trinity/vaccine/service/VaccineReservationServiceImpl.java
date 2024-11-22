package com.project.trinity.vaccine.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.trinity.hospital.model.vo.HospitalInfo;
import com.project.trinity.member.model.vo.Guest;
import com.project.trinity.vaccine.model.dao.VaccineReservationDao;
import com.project.trinity.vaccine.model.vo.VaccineReservation;

/**
 * VaccineReservationService 인터페이스의 구현 클래스
 * 예약 삽입 및 병원 목록 조회와 같은 백신 예약 관련 비즈니스 로직을 처리합니다.
 */
@Service
public class VaccineReservationServiceImpl implements VaccineReservationService {

    @Autowired
    private SqlSessionTemplate sqlSession; // MyBatis의 SqlSession을 사용하기 위한 템플릿 객체

    @Autowired
    private VaccineReservationDao vaccineReservationDao; // 데이터베이스 작업을 처리하는 DAO 객체
    
    /**
     * 백신 예약 정보를 데이터베이스에 삽입하는 메서드
     *
     * @param vaccineReservation 예약 정보가 담긴 VaccineReservation 객체
     */
    @Override
    public void insertReservation(VaccineReservation vaccineReservation) {
        vaccineReservationDao.insertReservation(sqlSession, vaccineReservation);
    }
    
    /**
     * 데이터베이스에서 모든 병원 목록을 조회하는 메서드
     *
     * @return 병원 정보가 담긴 HospitalInfo 객체의 리스트
     */
    @Override
    public List<HospitalInfo> getAllHospitals() {
        List<HospitalInfo> hospitalList = vaccineReservationDao.getAllHospitals(sqlSession);
        System.out.println("디버그 - 서비스에서 가져온 병원 목록: " + hospitalList); // 디버그용 출력
        return hospitalList;
    }

    @Override
    public String insertGuest(Guest guest) {
        String guestNo = vaccineReservationDao.insertGuest(sqlSession, guest);
        System.out.println("DEBUG: GUEST 테이블 삽입 완료 - GST_NO: " + guestNo);
        return guestNo;
    }
}
