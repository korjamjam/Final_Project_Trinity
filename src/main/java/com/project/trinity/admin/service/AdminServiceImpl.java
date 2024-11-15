package com.project.trinity.admin.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.project.trinity.admin.model.dao.AdminDao;
import com.project.trinity.member.model.vo.Member;
import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Autowired
    private AdminDao adminDao;

    @Override
    public List<Member> getAllMembers() {
        List<Member> members = adminDao.getAllMembers(sqlSession);
        for (Member member : members) {
            System.out.println("Member Info: " + member);
        }
        return members;
    }
}
