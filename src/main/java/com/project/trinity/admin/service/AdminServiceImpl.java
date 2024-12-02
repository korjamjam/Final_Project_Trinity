package com.project.trinity.admin.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.trinity.admin.model.dao.AdminDao;
import com.project.trinity.member.model.vo.Member;
import com.project.trinity.member.model.vo.Rankup;

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
    
    @Override
    public List<Rankup> getAllRankups() {
        return adminDao.getAllRankups(sqlSession);
    }
    
    @Override
    public Rankup getRankupDetail(int seqNo) {
        return adminDao.getRankupDetail(sqlSession, seqNo);
    }
    
    @Override
    public void approveRankup(int seqNo) {
        // Rankup 데이터 가져오기
        Rankup rankup = adminDao.getRankupDetail(sqlSession, seqNo);
        if (rankup != null && rankup.getUserNo() != null) {
            // MED_KEY 업데이트
            adminDao.updateMedKey(sqlSession, rankup.getUserNo(), rankup.getSubject());
            // 상태 업데이트
            adminDao.updateRankupStatus(sqlSession, seqNo, "A");
        }
    }

    @Override
    public void rejectRankup(int seqNo) {
        // Rankup 데이터 가져오기
        Rankup rankup = adminDao.getRankupDetail(sqlSession, seqNo);
        if (rankup != null && rankup.getUserNo() != null) {
            // MED_KEY NULL 처리
            adminDao.updateMedKey(sqlSession, rankup.getUserNo(), null);
            // 상태 업데이트
            adminDao.updateRankupStatus(sqlSession, seqNo, "D");
        }
    }


}