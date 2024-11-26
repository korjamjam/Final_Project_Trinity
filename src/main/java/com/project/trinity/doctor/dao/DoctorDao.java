package com.project.trinity.doctor.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.trinity.doctor.model.vo.DoctorApplication;

@Repository
public class DoctorDao {

    @Autowired
    private SqlSession sqlSession;

    public int applyDoctor(DoctorApplication application) {
        return sqlSession.insert("doctorMapper.applyDoctor", application);
    }
}
