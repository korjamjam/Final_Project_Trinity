package com.project.trinity.community.board.service;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.trinity.community.board.model.dao.BoardDao;
import com.project.trinity.community.board.model.vo.Board;
import com.project.trinity.community.board.model.vo.BoardFile;
import com.project.trinity.community.board.model.vo.Like;
import com.project.trinity.community.board.model.vo.Comment;
import com.project.trinity.community.common.vo.PageInfo;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {

    @Autowired
    private final SqlSessionTemplate sqlSession;

    @Autowired
    private final BoardDao boardDao;

    // 게시글 관련 메서드
    @Override
    public int selectListCount() {
        return boardDao.selectListCount(sqlSession);
    }

    @Override
    public int increaseCount(String bno) {
        return boardDao.increaseCount(sqlSession, bno);
    }

    @Override
    public ArrayList<Board> selectList(PageInfo pi, String sortType) {
        return boardDao.selectList(sqlSession, pi, sortType);
    }

    @Override
    public ArrayList<Board> selectRecentPopularList(Map<String, Object> params) {
        return boardDao.selectRecentPopularList(sqlSession, params);
    }

    @Override
    public int selectCountCategoryList(String type) {
        return boardDao.selectCountCategoryList(sqlSession, type);
    }

    @Override
    public ArrayList<Board> selectListByCategory(String type, PageInfo pi) {
        return boardDao.selectListByCategory(sqlSession, type, pi);
    }

    @Override
    public Board selectBoard(String bno) {
        return boardDao.selectBoard(sqlSession, bno);
    }

    @Override
    public int insertBoard(Board b, String userNo) {
        b.setUserNo(userNo); // 작성자 설정
        return boardDao.insertBoard(sqlSession, b);
    }

    @Override
    public int updateBoard(Board b) {
        return boardDao.updateBoard(sqlSession, b);
    }

    @Override
    public int deleteBoard(String bno) {
        return boardDao.deleteBoard(sqlSession, bno);
    }

    // 첨부파일 관련 메서드
    @Override
    public int insertFile(BoardFile bf) {
        return boardDao.insertFile(sqlSession, bf);
    }

    @Override
    public BoardFile getSingleFile(String fileNo) {
        return boardDao.getSingleFile(sqlSession, fileNo);
    }

    @Override
    public ArrayList<BoardFile> getFilesList(String bno) {
        return boardDao.getFilesList(sqlSession, bno);
    }

    @Override
    public int deleteFile(String fileNo) {
        return boardDao.deleteFile(sqlSession, fileNo);
    }

    @Override
    public int deleteAllFilesByBoardNo(String boardNo) {
        return boardDao.deleteAllFilesByBoardNo(sqlSession, boardNo);
    }

    @Override
    public int updateFileAllowDownload(BoardFile bf) {
        return boardDao.updateFileAllowDownload(sqlSession, bf);
    }

    // 댓글 관련 메서드
    @Override
    public ArrayList<Comment> selectReply(String bno) {
        return boardDao.selectReply(sqlSession, bno);
    }

    @Override
    public int insertReply(Comment r) {
        return boardDao.insertReply(sqlSession, r);
    }

    @Override
    public int deleteReply(String commentNo) {
        return boardDao.deleteReply(sqlSession, commentNo);
    }
    @Override
    public int getLikeCount(String commentNo) {
        return boardDao.getLikeCount(sqlSession, commentNo);
    }

    @Override
    public int getDislikeCount(String commentNo) {
        return boardDao.getDislikeCount(sqlSession, commentNo); // 싫어요 처리
    }


    @Override
    public Like getCurrentLikeState(String commentNo, String userNo) {
        return boardDao.getCurrentLikeState(sqlSession, commentNo, userNo);
    }

    
    @Override
    public void updateLikeDislike(String commentNo, String userNo, int isLike) {
        // DAO의 updateLikeDislike 메서드 호출
        boardDao.updateLikeDislike(sqlSession, commentNo, userNo, isLike);
    }



    @Override
    public void deleteLikeDislike(String commentNo, String userNo) {
        boardDao.deleteLikeDislike(sqlSession, commentNo, userNo);
    }

    @Override
    public void insertLikeDislike(String commentNo, String userNo, int isLike) {
        boardDao.insertLikeDislike(sqlSession, commentNo, userNo, isLike);
    }

	

}
