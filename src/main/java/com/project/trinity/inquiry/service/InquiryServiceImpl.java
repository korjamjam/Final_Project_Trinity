package com.project.trinity.inquiry.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.trinity.community.board.model.vo.Board;
import com.project.trinity.inquiry.model.dao.InquiryDao;

@Service
public class InquiryServiceImpl implements InquiryService {

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Autowired
    private InquiryDao inquiryDao;

    public List<Board> getNotices() {
        return inquiryDao.selectNotices(sqlSession);
    }

	@Override
	public List<Board> getReportes() {
		// TODO Auto-generated method stub
		return inquiryDao.selectReportes(sqlSession);
	}

	@Override
	public List<Board> getFaqs() {
		// TODO Auto-generated method stub
		return inquiryDao.selectFaqs(sqlSession);
	}

	@Override
	public List<Board> getQnas() {
		// TODO Auto-generated method stub
		return inquiryDao.selectQnas(sqlSession);
	}
}