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

    // 게시글 목록 가져오기
    ArrayList<Board> selectList(PageInfo pi, String sortType);
    
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
    
    // 게시글 수정
    int updateBoard(Board b);

    // 댓글 목록 가져오기
    ArrayList<Reply> selectReply(String bno);

    // 댓글 추가
    int insertReply(Reply r);

    // 조회수 상위 5개의 게시글 가져오기
    ArrayList<Board> selectTopBoardList();

    // 게시글 삭제
    int deleteBoard(String boardNo);


    // 특정 파일 삭제
    int deleteFile(String fileNo);

    // 특정 게시글의 모든 첨부파일 삭제 (롤백 처리 지원)
    int deleteAllFilesByBoardNo(String boardNo);

 // 특정 파일의 다운로드 허용 여부 업데이트
    int updateFileAllowDownload(BoardFile bf);

}
