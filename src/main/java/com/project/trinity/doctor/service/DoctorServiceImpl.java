package com.project.trinity.doctor.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.trinity.doctor.dao.DoctorDao;
import com.project.trinity.doctor.model.vo.DoctorApplication;

@Service
public class DoctorServiceImpl implements DoctorService {

    @Autowired
    private DoctorDao doctorDao;

    @Override
    public int applyDoctor(DoctorApplication application) {
        return doctorDao.applyDoctor(application);
    }
}
