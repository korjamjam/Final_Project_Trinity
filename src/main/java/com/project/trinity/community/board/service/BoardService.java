package com.project.trinity.community.board.service;

import java.util.ArrayList;

import com.project.trinity.community.board.model.vo.Board;
import com.project.trinity.community.board.model.vo.Reply;
import com.project.trinity.community.common.vo.PageInfo;

public interface BoardService {
	//게시글 총 갯수 가져오기
	int selectListCount();
	
	//게시글 목록 가져오기
	ArrayList<Board> selectList(PageInfo pi, String sortType);
	
	//게시글 조회수 증가
	int increaseCount(String bno);
	
	//boardNo로 게시글 조회
	Board selectBoard(String bno);
	
	//게시글 추가(insert) 
	int insertBoard(Board b);
	
	//게시글 수정
	int updateBoard(Board b);
	
	//댓글목록 가져오기
	ArrayList<Reply> selectReply(String bno);
	
	//댓글 추가
	int insertReply(Reply r);
	
	//조회수 상위 5개
	public ArrayList<Board> selectTopBoardList();
}






