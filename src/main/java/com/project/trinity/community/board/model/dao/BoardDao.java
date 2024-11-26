package com.project.trinity.community.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.trinity.community.board.model.vo.Board;
import com.project.trinity.community.board.model.vo.BoardFile;
import com.project.trinity.community.board.model.vo.Reply;
import com.project.trinity.community.common.vo.PageInfo;

@Repository
public class BoardDao {

	// 게시글 총 갯수 가져오기
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectListCount");
	}

	// 게시글 목록 가져오기
	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi, String sortType) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) (sqlSession.selectList("boardMapper.selectList", sortType, rowBounds));
	}

	public ArrayList<Board> selectPopularList(SqlSessionTemplate sqlSession, Map<String, Object> params) {
		return (ArrayList) sqlSession.selectList("boardMapper.selectPopularList", params);
	}

	// 게시글 조회수 증가
	public int increaseCount(SqlSessionTemplate sqlSession, String bno) {
		return sqlSession.update("boardMapper.increaseCount", bno);
	}

	// 게시글 조회
	public Board selectBoard(SqlSessionTemplate sqlSession, String bno) {
		return sqlSession.selectOne("boardMapper.selectBoard", bno);
	}

	// 게시글 추가
	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertBoard", b);
	}

	// 첨부파일 추가
	public int insertFile(SqlSessionTemplate sqlSession, BoardFile bf) {
		return sqlSession.insert("boardMapper.insertFile", bf);
	}

	//  단일 파일 정보 가져오기
	public BoardFile getSingleFile(SqlSessionTemplate sqlSession, String fileNo) {
		return sqlSession.selectOne("boardMapper.getSingleFile", fileNo);
	}

	// 특정 게시글의 첨부파일 조회
	public ArrayList<BoardFile> getFilesList(SqlSessionTemplate sqlSession, String bno) {
		return (ArrayList) (sqlSession.selectList("boardMapper.getFilesList", bno));
	}

	// 특정 게시글의 첨부파일 삭제
	public int deleteFilesByBoardNo(SqlSessionTemplate sqlSession, String bno) {
		return sqlSession.delete("boardMapper.deleteFilesByBoardNo", bno);
	}

	// 특정 파일 삭제
	public int deleteFile(SqlSessionTemplate sqlSession, String fileNo) {
		return sqlSession.delete("boardMapper.deleteFile", fileNo);
	}

	public int updateFileAllowDownload(SqlSessionTemplate sqlSession, BoardFile bf) {
		return sqlSession.update("boardMapper.updateFileAllowDownload", bf);
	}

	// 게시글 수정
	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.updateBoard", b);
	}

	// 게시글 삭제
	public int deleteBoard(SqlSessionTemplate sqlSession, String boardNo) {
		return sqlSession.delete("boardMapper.deleteBoard", boardNo);
	}

	public ArrayList<Reply> selectReply(SqlSessionTemplate sqlSession, String bno) {
		return (ArrayList) sqlSession.selectList("boardMapper.selectReply", bno);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("boardMapper.insertReply", r);
	}

	public ArrayList<Board> selectTopBoardList(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("boardMapper.selectTopBoardList");
	}

	public int deleteReply(SqlSessionTemplate sqlSession, String replyNo) {
	    return sqlSession.delete("boardMapper.deleteReply", replyNo);
	}

	public int updateLikeCount(SqlSessionTemplate sqlSession, String commentNo) {
	    return sqlSession.update("boardMapper.updateLikeCount", commentNo);
	}


}