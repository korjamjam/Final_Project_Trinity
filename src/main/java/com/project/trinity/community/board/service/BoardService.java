package com.project.trinity.community.board.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.project.trinity.community.board.model.vo.Board;
import com.project.trinity.community.board.model.vo.BoardFile;
import com.project.trinity.community.board.model.vo.Like;
import com.project.trinity.community.board.model.vo.Comment;
import com.project.trinity.community.common.vo.PageInfo;

public interface BoardService {

    // 게시글 관련 메서드
    int selectListCount(); // 게시글 총 갯수 가져오기
    ArrayList<Board> selectList(PageInfo pi, String sortType); // 게시글 목록 가져오기
    List<Board> selectRecentPopularList(Map<String, Object> params); // 최근 인기 게시글 조회
    ArrayList<Board> selectListByCategory(String type, PageInfo pi); // 카테고리별 게시글 목록
    int selectCountCategoryList(String type); // 카테고리별 게시글 수 조회
    Board selectBoard(String boardNo); // 게시글 조회
    int increaseCount(String boardNo); // 게시글 조회수 증가
    int insertBoard(Board b, String userNo); // 게시글 추가
    int updateBoard(Board b); // 게시글 수정
    int deleteBoard(String boardNo); // 게시글 삭제
    String getCategoryNameById(String categoryId);
    
    // 파일 관련 메서드
    int insertFile(BoardFile bf); // 첨부파일 추가
    BoardFile getSingleFile(String fileNo); // 특정 파일 정보 가져오기
    List<BoardFile> getFilesList(String boardNo); // 특정 게시글의 모든 첨부파일
    int deleteAllFilesByBoardNo(String boardNo); // 게시글의 모든 첨부파일 삭제
    int deleteFile(String fileNo); // 특정 파일 삭제
    int updateFileAllowDownload(BoardFile bf); // 파일 다운로드 허용 여부 수정

    // 댓글 관련 메서드
    ArrayList<Comment> selectReply(String boardNo); // 댓글 목록 가져오기
    int insertReply(Comment r); // 댓글 추가
    int deleteReply(String commentNo); // 댓글 삭제

    // 좋아요/싫어요 관련 메서드
    int getLikeCount(String commentNo);
	int getDislikeCount(String commentNo);
	Like getCurrentLikeState(String commentNo, String userNo); // 좋아요/싫어요 상태 조회
    void deleteLikeDislike(String commentNo, String userNo); // 좋아요/싫어요 삭제
    void insertLikeDislike(String commentNo, String userNo, int isLike); // 좋아요/싫어요 추가
    void updateLikeDislike(String commentNo, String userNo, int isLike);
	

  
}
