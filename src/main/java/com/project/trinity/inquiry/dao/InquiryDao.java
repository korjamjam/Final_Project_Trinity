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
	    	 System.out.println("categoryId value in Dao: " + categoryId);
	        return sqlSession.selectOne("inquiryMapper.getListCount", categoryId);
	    }
	    /**
	     * 특정 카테고리의 게시글 목록을 페이징 처리하여 조회합니다.
	     * @param sortType 
	     */
	    public ArrayList<Inquiry> selectListByCategory(SqlSessionTemplate sqlSession, String categoryId, PageInfo pi, String sortType) {
	        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
	        int limit = pi.getBoardLimit();
	        Map<String, Object> params = new HashMap<>();
	        params.put("categoryId", categoryId);
	        params.put("startRow", offset + 1);
	        params.put("endRow", offset + limit);
	        params.put("sortType", sortType);
	       
	        System.out.println("다오 ams for selectListByCategory: " + params);
	     
	        List<Inquiry> result = sqlSession.selectList("inquiryMapper.selectListByCategory", params);
	        System.out.println("DAO 결과: " + result); // 결과 출력 
	        return new ArrayList<>(result);
	    }
}