package com.project.trinity.community.board.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.project.trinity.community.board.model.dao.BoardDao;
import com.project.trinity.community.board.model.vo.Board;
import com.project.trinity.community.board.model.vo.Reply;
import com.project.trinity.community.common.vo.PageInfo;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class BoardServiceImpl implements BoardService {

    private final SqlSessionTemplate sqlSession;
    private final BoardDao boardDao;
    
    @Override
    public int selectListCount() {
        return boardDao.selectListCount(sqlSession);
    }

    @Override
    public ArrayList<Board> selectList(PageInfo pi, String sortType) {
        return boardDao.selectList(sqlSession, pi, sortType);
    }


    @Override
    public int increaseCount(int bno) {
        return boardDao.increaseCount(sqlSession, bno);
    }

    @Override
    public Board selectBoard(int bno) {
        return boardDao.selectBoard(sqlSession, bno);
    }

    @Override
    public int insertBoard(Board b) {
        return boardDao.insertBoard(sqlSession, b);
    }

    @Override
    public int updateBoard(Board b) {
        return boardDao.updateBoard(sqlSession, b);
    }

    @Override
    public ArrayList<Reply> selectReply(int bno) {
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

	@Override
	public int deleteBoard(int boardNo) {
		// TODO Auto-generated method stub
		return 0;
	}
}
