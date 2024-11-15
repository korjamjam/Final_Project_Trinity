package com.project.trinity.healthreservation.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.trinity.healthreservation.model.dao.HealthReservationDao;

@Service
public class HealthReservationServiceImpl implements HealthReservationService {
	
	@Autowired
    private SqlSessionTemplate sqlSession;
    
    @Autowired
    private HealthReservationDao healthdao;

}
