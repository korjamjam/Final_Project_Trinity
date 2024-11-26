package com.project.trinity.community.board.service;

import java.util.ArrayList;
import java.util.Map;

import com.project.trinity.community.board.model.vo.Board;
import com.project.trinity.community.board.model.vo.BoardFile;
import com.project.trinity.community.board.model.vo.Reply;
import com.project.trinity.community.common.vo.PageInfo;

public interface BoardService {

	// 게시글 총 갯수 가져오기
	int selectListCount();

<<<<<<< HEAD
	// 게시글 목록 가져오기
	ArrayList<Board> selectList(PageInfo pi, String sortType);
=======
    // 게시글 목록 가져오기
    ArrayList<Board> selectList(PageInfo pi, String sortType);
    
    // 최근 7일 내 인기 게시글 조회
    ArrayList<Board> selectRecentPopularList(Map<String, Object> params);
    
    // 카테고리별 게시글 수 조회 메서드
    int selectCountCategoryList(String type);

    // 카테고리별 게시글 목록 조회 메서드 (기존 유지)
    ArrayList<Board> selectListByCategory(String type, PageInfo pi);


>>>>>>> 26f49db99ca975a81c5fde1a16f23e7a9be1b8c0

	ArrayList<Board> selectPopularList(Map<String, Object> params);

	// 게시글 조회수 증가
	int increaseCount(String bno);

	// 게시글 번호로 게시글 조회
	Board selectBoard(String bno);

	// 게시글 추가(insert)
	int insertBoard(Board b, String userNo);

	// 첨부파일 추가
	int insertFile(BoardFile bf);

	// 특정 파일 1개의 정보를 가져오는 메서드 정의
	BoardFile getSingleFile(String fileNo);

	// 특정 게시글의 모든 첨부파일 목록 가져오기
	ArrayList<BoardFile> getFilesList(String bno);
	
	// 특정 게시글의 모든 첨부파일 삭제 (롤백 처리 지원)
	int deleteAllFilesByBoardNo(String boardNo);

	// 특정 파일의 다운로드 허용 여부 업데이트
	int updateFileAllowDownload(BoardFile bf);

	// 게시글 수정
	int updateBoard(Board b);

	// 게시글 삭제
	int deleteBoard(String boardNo);

	// 특정 파일 삭제
	int deleteFile(String fileNo);

	// 댓글목록 가져오기
	ArrayList<Reply> selectReply(String bno);

	// 댓글 추가
	int insertReply(Reply r);

	// 조회수 상위 5개
	public ArrayList<Board> selectTopBoardList();

	int deleteReply(String replyNo);

	int updateLikeCount(String commentNo);


}
