package com.project.trinity.community.board.service;


import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.trinity.community.board.model.dao.BoardDao;
import com.project.trinity.community.board.model.vo.Board;
import com.project.trinity.community.board.model.vo.Reply;
import com.project.trinity.community.common.vo.PageInfo;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class BoardServiceImpl implements BoardService{
 
	@Autowired
	private final SqlSessionTemplate sqlSession;
	
	@Autowired
	private final BoardDao boardDao;
	
	@Override
	public int selectListCount() {
		return boardDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi, String sortType) {
		
		return boardDao.selectList(sqlSession, pi);
	} 

	@Override
	public int increaseCount(String bno) {
		return boardDao.increaseCount(sqlSession, bno);
	}

	@Override
	public Board selectBoard(String bno) {
		return boardDao.selectBoard(sqlSession, bno);
	}

	
	@Override
	public int insertBoard(Board b, String userNo) {
	    // 로그인한 사용자의 userNo 설정
	    b.setUserNo(userNo);
	    return boardDao.insertBoard(sqlSession, b);
	}

	@Override
	public int updateBoard(Board b) {
		
		return boardDao.updateBoard(sqlSession, b);
	}

	@Override
	public ArrayList<Reply> selectReply(String bno) {
		return boardDao.selectReply(sqlSession, bno);
	}

	@Override
	public int insertReply(Reply r) {
		return boardDao.insertReply(sqlSession, r);
	}

	@Override
	public ArrayList<Board> selectTopBoardList() {
		return boardDao.selectTopBoardList(sqlSession);
	}

}
