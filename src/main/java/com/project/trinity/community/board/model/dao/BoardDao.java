package com.project.trinity.community.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.trinity.community.board.model.vo.Board;
import com.project.trinity.community.board.model.vo.BoardCategory;
import com.project.trinity.community.board.model.vo.BoardFile;
import com.project.trinity.community.board.model.vo.Like;
import com.project.trinity.community.board.model.vo.Comment;
import com.project.trinity.community.common.vo.PageInfo;

@Repository
public class BoardDao {

    // 1. 게시글 관리

    /**
     * 전체 게시글 수를 조회합니다.
     */
    public int selectListCount(SqlSessionTemplate sqlSession) {
    	
        return sqlSession.selectOne("boardMapper.selectListCount");
    }


    /**
     * 특정 카테고리에 해당하는 게시글 수를 조회합니다.
     */
    public int selectCountCategoryList(SqlSessionTemplate sqlSession, String categoryId) {
        return sqlSession.selectOne("boardMapper.selectCountCategoryList", categoryId);
    }

   
    /**
     * 인기 게시글 목록을 조회합니다.
     */
    public ArrayList<Board> selectPopularList(SqlSessionTemplate sqlSession, Map<String, Object> params) {
        return (ArrayList) sqlSession.selectList("boardMapper.selectPopularList", params);
    }

    /**
     * 특정 게시글의 상세 내용을 조회합니다.
     */
    public Board selectBoard(SqlSessionTemplate sqlSession, String bno) {
    	 System.out.println("다오 bno: " + bno);  
        return sqlSession.selectOne("boardMapper.selectBoard", bno);
    }

    /**
     * 새 게시글을 추가합니다.
     */
    public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
        return sqlSession.insert("boardMapper.insertBoard", b);
    }

    /**
     * 기존 게시글을 수정합니다.
     */
    public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
        return sqlSession.update("boardMapper.updateBoard", b);
    }

    /**
     * 게시글을 삭제합니다.
     */
    public List<BoardFile> getFilesForBoard(SqlSessionTemplate sqlSession, String bno) {
        return sqlSession.selectList("BoardMapper.getFilesForBoard", bno);
    }


    // 2. 첨부파일 관리

    /**
     * 첨부파일 정보를 추가합니다.
     */
    public int insertFile(SqlSessionTemplate sqlSession, BoardFile bf) {
        return sqlSession.insert("boardMapper.insertFile", bf);
    }

    /**
     * 특정 첨부파일 정보를 조회합니다.
     */
    public BoardFile getSingleFile(SqlSessionTemplate sqlSession, String fileNo) {
        return sqlSession.selectOne("boardMapper.getSingleFile", fileNo);
    }

    /**
     * 특정 게시글에 첨부된 파일 목록을 조회합니다.
     */
    public List<BoardFile> getFilesList(SqlSessionTemplate sqlSession, String bno) {
        return sqlSession.selectList("boardMapper.getFilesList", bno);
    }



    /**
     * 특정 게시글의 첨부파일을 모두 삭제합니다.
     */
    public int deleteFilesByBoardNo(SqlSessionTemplate sqlSession, String bno) {
        return sqlSession.delete("boardMapper.deleteFilesByBoardNo", bno);
    }

    /**
     * 특정 첨부파일을 삭제합니다.
     */
    public int deleteFile(SqlSessionTemplate sqlSession, String fileNo) {
        return sqlSession.delete("boardMapper.deleteFile", fileNo);
    }

    /**
     * 첨부파일의 다운로드 가능 여부를 업데이트합니다.
     */
    public int updateFileAllowDownload(SqlSessionTemplate sqlSession, BoardFile bf) {
        return sqlSession.update("boardMapper.updateFileAllowDownload", bf);
    }

    // 3. 댓글 관리

    /**
     * 특정 게시글에 달린 댓글 목록을 조회합니다.
     */
    public ArrayList<Comment> selectReply(SqlSessionTemplate sqlSession, String bno) {
        return (ArrayList) sqlSession.selectList("boardMapper.selectReply", bno);
    }

    /**
     * 새 댓글을 추가합니다.
     */
    public int insertComment(SqlSessionTemplate sqlSession, Comment r) {
        return sqlSession.insert("boardMapper.insertReply", r);
    }

    /**
     * 특정 댓글을 삭제합니다.
     */
    public int deleteComment(SqlSessionTemplate sqlSession, String commentNo) {
        return sqlSession.delete("boardMapper.deleteReply", commentNo);
    }

    // 4. 조회수 관리

    /**
     * 특정 게시글의 조회수를 증가시킵니다.
     */
    public int increaseCount(SqlSessionTemplate sqlSession, String bno) {
    	 System.out.println("Increasing count for boardNo: " + bno);
        return sqlSession.update("boardMapper.increaseCount", bno);
    }

    // 6. 기타

    /**
     * 특정 게시글의 첨부파일을 모두 삭제합니다.
     */
    public int deleteAllFilesByBoardNo(SqlSessionTemplate sqlSession, String bno) {
        return sqlSession.delete("boardMapper.deleteAllFilesByBoardNo", bno);
    }

    public int deleteCommentsByBoardNo(SqlSessionTemplate sqlSession, String bno) {
        return sqlSession.delete("boardMapper.deleteCommentsByBoardNo", bno);
    }

    public int deleteBoard(SqlSessionTemplate sqlSession, String bno) {
        return sqlSession.delete("boardMapper.deleteBoard", bno);
    }
    
    
    
    
    
    // 좋아요/싫어요 관리
    
    /**
     * 현재 사용자의 특정 댓글에 대한 좋아요/싫어요 상태를 조회합니다.
     */
    public Like getCurrentLikeState(SqlSessionTemplate sqlSession, String commentNo, String userNo) {
        Map<String, Object> params = new HashMap<>();
        params.put("commentNo", commentNo);
        params.put("userNo", userNo);
        return sqlSession.selectOne("boardMapper.getCurrentLikeState", params);
    }



    /**
     * 특정 댓글에 좋아요 또는 싫어요를 추가합니다.
     */
    public void insertLikeDislike(SqlSessionTemplate sqlSession, String commentNo, String userNo, int isLike) {
        Map<String, Object> params = new HashMap<>();
        params.put("commentNo", commentNo);
        params.put("userNo", userNo);
        params.put("isLike", isLike); 
        sqlSession.insert("boardMapper.insertLikeDislike", params);
    }


    /**
     * 특정 댓글의 좋아요/싫어요를 삭제합니다.
     */
    public void deleteLikeDislike(SqlSessionTemplate sqlSession, String commentNo, String userNo) {
        Map<String, Object> params = new HashMap<>();
        params.put("commentNo", commentNo);
        params.put("userNo", userNo);
        sqlSession.delete("boardMapper.deleteLikeDislike", params);
    }

    /**
     * 특정 댓글에 대한 좋아요 수를 조회합니다.
     */
    public int getLikeCount(SqlSessionTemplate sqlSession, String commentNo) {
        return sqlSession.selectOne("boardMapper.getLikeCount", commentNo);
    }

    /**
     * 특정 댓글에 대한 싫어요 수를 조회합니다.
     */
    public int getDislikeCount(SqlSessionTemplate sqlSession, String commentNo) {
        return sqlSession.selectOne("boardMapper.getDislikeCount", commentNo);
    }

    
    public void updateLikeDislike(SqlSessionTemplate sqlSession, String commentNo, String userNo, int isLike) {
        Map<String, Object> params = new HashMap<>();
        params.put("commentNo", commentNo);
        params.put("userNo", userNo);
        params.put("isLike", isLike);

        sqlSession.update("boardMapper.updateLikeDislike", params);
    }

    public String getCategoryNameById(SqlSessionTemplate sqlSession, String categoryId) {
    	System.out.println("Category ID in service: " + categoryId);
    	return sqlSession.selectOne("boardMapper.getCategoryNameById", categoryId);
    }

	
    // 게시글의 총 개수 (타입에 따라 필터링 가능)
    public int getListCount(SqlSessionTemplate sqlSession, String categoryId) {
    	 System.out.println("categoryId value: " + categoryId);
        return sqlSession.selectOne("boardMapper.getListCount", categoryId);
    }

    // 최근 인기 게시글 목록 조회

    /**
     * 페이징 처리를 적용하여 게시글 목록을 조회합니다.
     */
    public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi, String sortType) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return (ArrayList) sqlSession.selectList("boardMapper.selectList", sortType, rowBounds);
    }

   
    /**
     * 특정 카테고리의 게시글 목록을 페이징 처리하여 조회합니다.
     */
    public ArrayList<Board> selectListByCategory(SqlSessionTemplate sqlSession, String categoryId, PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        int limit = pi.getBoardLimit();
        Map<String, Object> params = new HashMap<>();
        params.put("categoryId", categoryId);
        params.put("startRow", offset + 1);
        params.put("endRow", offset + limit);
        
        System.out.println(params);
        return (ArrayList) sqlSession.selectList("boardMapper.selectListByCategory", params);
    }

    public List<Board> selectRecentPopularList(SqlSessionTemplate sqlSession, PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        int limit = pi.getBoardLimit();
        Map<String, Object> params = new HashMap<>();
        params.put("startRow", offset + 1);
        params.put("endRow", offset + limit);

        return sqlSession.selectList("boardMapper.selectRecentPopularList", params);
    }


    public List<BoardCategory> selectList(SqlSessionTemplate sqlSession) {
        return sqlSession.selectList("boardMapper.selectAllCategories");  // boardMapper의 쿼리 호출
    }


    




}
