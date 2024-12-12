package com.project.trinity.inquiry.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.trinity.community.board.model.vo.Board;
import com.project.trinity.community.common.vo.PageInfo;
import com.project.trinity.inquiry.vo.Inquiry;

@Repository
public class InquiryDao {

    // 게시글의 총 개수 (타입에 따라 필터링 가능)
	 public int getListCount(SqlSessionTemplate sqlSession, String categoryId) {
	        return sqlSession.selectOne("inquiryMapper.getListCount", categoryId);  // 매퍼 호출
	    }

    // 특정 카테고리의 게시글 목록을 페이징 처리하여 조회
    public ArrayList<Inquiry> selectListByCategory(SqlSessionTemplate sqlSession, String categoryId, PageInfo pi, String sortType) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        int limit = pi.getBoardLimit();
        Map<String, Object> params = new HashMap<>();
        params.put("categoryId", categoryId);
        params.put("startRow", offset + 1);
        params.put("endRow", offset + limit);
        params.put("sortType", sortType);

 

        List<Inquiry> result = sqlSession.selectList("inquiryMapper.selectListByCategory", params);
    
        return new ArrayList<>(result);
    }

    // 조회수 증가
    public void updateInquiryViews(SqlSessionTemplate sqlSession, String ino) {
        sqlSession.update("inquiryMapper.updateInquiryViews", ino);
    }

    // 특정 게시글 상세 조회
    public Inquiry selectInquiryDetail(SqlSessionTemplate sqlSession, String ino) {
        return sqlSession.selectOne("inquiryMapper.selectInquiryDetail", ino);
    }

	public List<Board> getLatestInquiryPosts(SqlSessionTemplate sqlSession, String ct) {
		 return sqlSession.selectList("inquiryMapper.getLatestInquiryPosts", ct);
	}
	
}
