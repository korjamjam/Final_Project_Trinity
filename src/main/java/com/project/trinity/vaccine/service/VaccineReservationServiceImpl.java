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
 * 백신 예약 서비스 구현 클래스
 * - VaccineReservationService 인터페이스를 구현
 * - 백신 예약과 관련된 비즈니스 로직을 처리
 * - DAO(Data Access Object)와 연동하여 데이터베이스 작업 수행
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
        System.out.println("DEBUG: insertReservation 호출됨");
        System.out.println("DEBUG: 예약 정보 - " + vaccineReservation);
        
        //DAO를 호출하여 예약 정보를 DB에 저장
        vaccineReservationDao.insertReservation(sqlSession, vaccineReservation);

        System.out.println("DEBUG: 예약 정보 삽입 완료");
    }

    /**
     * 데이터베이스에서 모든 병원 목록을 조회하는 메서드
     * @return 병원 정보가 담긴 HospitalInfo 객체의 리스트
     */
    @Override
    public List<HospitalInfo> getAllHospitals() {
        System.out.println("DEBUG: getAllHospitals 호출됨");

        //DAO를 통해 병원 목록을 DB에서 가져옴
        List<HospitalInfo> hospitalList = vaccineReservationDao.getAllHospitals(sqlSession);

        if (hospitalList == null || hospitalList.isEmpty()) {
            System.out.println("DEBUG: 병원 목록이 비어 있습니다.");
        } else {
            System.out.println("DEBUG: 병원 목록 개수 - " + hospitalList.size());
            for (HospitalInfo hospital : hospitalList) {
                System.out.println("DEBUG: 병원 정보 - " + hospital);
            }
        }

        return hospitalList;
    }
    
     /**
     * 비회원(Guest) 정보를 데이터베이스에 삽입하는 메서드
     *
     * @param guest 비회원 예약 정보를 담은 Guest 객체
     * @return 삽입된 Guest의 ID (GST_NO)
     */
    @Override
    public String insertGuest(Guest guest) {
        System.out.println("DEBUG: insertGuest 호출됨");
        System.out.println("DEBUG: 게스트 정보 - " + guest);

        //DAO를 호출하여 비회원 정보 삽입 (Guest 테이블)
        String guestNo = vaccineReservationDao.insertGuest(sqlSession, guest);

        System.out.println("DEBUG: GUEST 테이블 삽입 완료 - GST_NO: " + guestNo);
        return guestNo;
    }

    /**
     * 예약 번호를 기반으로 예약 정보를 조회하는 메서드
     *
     * @param resNo 예약 번호
     * @return 조회된 예약 정보 (VaccineReservation 객체)
     */
    @Override
    public VaccineReservation selectReservation(String resNo) {
        System.out.println("DEBUG: selectReservation 호출됨");
        System.out.println("DEBUG: 조회할 예약 번호 - " + resNo);

        //DAO를 통해 예약 정보 조회
        VaccineReservation vaccineReservation = vaccineReservationDao.selectReservation(sqlSession, resNo);

        //조회된 데이터 검증
        if (vaccineReservation == null) {
            System.out.println("DEBUG: 조회된 예약 정보가 없습니다.");
        } else {
            System.out.println("DEBUG: 조회된 예약 정보 - " + vaccineReservation);
        }

        return vaccineReservation;
    }

    /**
     * 사용자 번호(UserNo)를 기반으로 해당 사용자의 예약 목록을 조회하는 메서드
     *
     * @param userNo 사용자 번호
     * @return 사용자의 예약 목록 (VaccineReservation 객체 리스트)
     */
    @Override
    public List<VaccineReservation> getReservationsByUserNo(String userNo) {
        System.out.println("DEBUG: getReservationsByUserNo 호출됨");
        System.out.println("DEBUG: 사용자 번호 - " + userNo);

        // DAO를 통해 특정 사용자의 예약 목록을 조회하여 반환
        return vaccineReservationDao.getReservationsByUserNo(sqlSession, userNo);
    }
}
