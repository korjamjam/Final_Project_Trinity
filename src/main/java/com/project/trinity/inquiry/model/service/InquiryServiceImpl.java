package com.project.trinity.inquiry.model.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.trinity.community.board.model.vo.Board;
import com.project.trinity.community.common.vo.PageInfo;
import com.project.trinity.inquiry.model.dao.InquiryDao;
import com.project.trinity.inquiry.model.vo.Inquiry;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class InquiryServiceImpl implements InquiryService {
    private final SqlSessionTemplate sqlSession;
    private final InquiryDao inquiryDao;

    @Transactional(rollbackFor = {Exception.class}) // 트랜잭션 적용
    @Override
    public Inquiry viewDetailPageWithCount(String ino) {
        // 조회수 증가
        inquiryDao.updateInquiryViews(sqlSession, ino);

        // 게시글 상세 조회
        Inquiry inq = inquiryDao.selectInquiryDetail(sqlSession, ino);

        // 조회된 게시글이 없으면 예외 처리
        if (inq == null) {
            throw new RuntimeException("게시글을 찾을 수 없습니다.");
        }

        return inq;
    }

    @Override
    public List<Inquiry> selectListByCategory(String categoryId, PageInfo pi, String sortType) {
        return inquiryDao.selectListByCategory(sqlSession, categoryId, pi, sortType);
    }

    @Override
    public int getListCount(String categoryId) {
        System.out.println("서비스 impl categoryId 값: " + categoryId);  // categoryId 출력
        return inquiryDao.getListCount(sqlSession, categoryId);  // DAO 호출
    }
    @Override
	public List<Board> getLatestInquiryPosts(String ct) {
		
	    return inquiryDao.getLatestInquiryPosts(sqlSession, ct);
	}
    @Override
    public String getPreviousBoard(String ino) {
        // 이전 게시글 번호 조회
        return inquiryDao.getPreviousBoard(sqlSession, ino);
    }

    @Override
    public String getNextBoard(String ino) {
        // 다음 게시글 번호 조회
        return inquiryDao.getNextBoard(sqlSession, ino);
    }
       
}

