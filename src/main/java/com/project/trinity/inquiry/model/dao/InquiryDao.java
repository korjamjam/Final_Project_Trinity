package com.project.trinity.inquiry.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.trinity.community.board.model.vo.Board;

@Repository
public class InquiryDao {

	public List<Board> selectNotices(SqlSessionTemplate sqlSession) {
	    return sqlSession.selectList("inquirymapper.selectNotices");
	}
	
	public List<Board> selectReportes(SqlSessionTemplate sqlSession) {
	    return sqlSession.selectList("inquirymapper.selectReportes");
	}
	
	public List<Board> selectFaqs(SqlSessionTemplate sqlSession) {
	    return sqlSession.selectList("inquirymapper.selectFaqs");
	}
	
	public List<Board> selectQnas(SqlSessionTemplate sqlSession) {
	    return sqlSession.selectList("inquirymapper.selectQnas");
	}
}