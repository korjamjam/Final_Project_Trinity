package com.project.trinity.community.board.service;

import java.util.ArrayList;
import java.util.List;

import com.project.trinity.community.board.model.vo.Board;
import com.project.trinity.community.board.model.vo.BoardCategory;
import com.project.trinity.community.board.model.vo.BoardFile;
import com.project.trinity.community.board.model.vo.Comment;
import com.project.trinity.community.board.model.vo.Like;
import com.project.trinity.community.board.model.vo.MedAnswer;
import com.project.trinity.community.common.vo.PageInfo;

public interface BoardService {

    // 1. 게시글 관련 메서드
    int selectListCount(); // 전체 게시글 수 조회
    int getListCount(String categoryId); // 특정 카테고리 게시글 수 조회
    List<Board> selectRecentPopularList(PageInfo pi); // 실시간 인기 게시글 목록 조회
    List<Board> selectListByCategory(String categoryId, PageInfo pi, String sortType); // 카테고리별 게시글 목록 조회
	int selectCountCategoryList(String type);
    Board viewDetailPage(String bno); // 특정 게시글 상세 조회
    int increaseCount(String bno); // 게시글 조회수 증가
    int insertBoard(Board b, String userNo); // 새 게시글 추가
    int updateBoard(Board b, ArrayList<BoardFile> fileList); // 게시글 수정
    int deleteBoard(String bno); // 게시글 삭제
    int adminDeleteBoard(String bno); // 관리자에 의한 게시글 삭제
    int restoreBoard(String bno); // 삭제된 게시글 복구
    String getCategoryNameById(String categoryId); // 카테고리 ID로 카테고리 이름 조회
    String getPreviousBoard(String bno); // 이전 게시글 조회
    String getNextBoard(String bno); // 다음 게시글 조회
    List<Board> getPostsByUserNo(String userNo); // 특정 사용자의 게시글 조회
    List<Board> getLatestPosts(String ct); // 최신 게시글 목록 조회
    List<Board> getPostsByHosNo(String hosNo); // 특정 병원의 게시글 조회

    // 2. 파일 관련 메서드
    int insertFile(BoardFile bf); // 첨부파일 추가
    BoardFile getSingleFile(String fileNo); // 특정 파일 정보 조회
    List<BoardFile> getFileList(String bno); // 특정 게시글의 모든 첨부파일 조회
    int deleteAllFilesByBoardNo(String bno); // 특정 게시글의 모든 첨부파일 삭제
    int deleteFile(String fileNo); // 특정 파일 삭제
    int updateFileAllowDownload(BoardFile bf); // 파일 다운로드 허용 여부 수정

    // 3. 댓글 관련 메서드
    ArrayList<Comment> selectReply(String bno); // 댓글 목록 조회
    int insertComment(Comment r); // 댓글 추가
    int deleteComment(String commentNo); // 댓글 삭제

    // 4. 좋아요/싫어요 관련 메서드
    int getLikeCount(String commentNo); // 댓글의 좋아요 수 조회
    int getDislikeCount(String commentNo); // 댓글의 싫어요 수 조회
    Like getCurrentLikeState(String commentNo, String userNo); // 특정 사용자의 좋아요/싫어요 상태 조회
    void deleteLikeDislike(String commentNo, String userNo); // 좋아요/싫어요 기록 삭제
    void insertLikeDislike(String commentNo, String userNo, int isLike); // 좋아요/싫어요 추가
    void updateLikeDislike(String commentNo, String userNo, int isLike); // 좋아요/싫어요 상태 업데이트

    // 5. 카테고리 관련 메서드
    List<BoardCategory> getCategories(); // 카테고리 목록 조회

    // 6. 답변 관련 메서드
    List<MedAnswer> getAnswersByBoardNo(String bno); // 특정 게시글의 답변 조회
    int saveAnswer(MedAnswer ans); // 답변 저장
}
