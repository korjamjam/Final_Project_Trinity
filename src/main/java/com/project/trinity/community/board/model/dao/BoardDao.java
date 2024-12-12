package com.project.trinity.community.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.trinity.community.board.model.vo.Board;
import com.project.trinity.community.board.model.vo.BoardCategory;
import com.project.trinity.community.board.model.vo.BoardFile;
import com.project.trinity.community.board.model.vo.Like;
import com.project.trinity.community.board.model.vo.MedAnswer;
import com.project.trinity.community.board.model.vo.Comment;
import com.project.trinity.community.common.vo.PageInfo;

@Repository
public class BoardDao {

    // ========================= 게시글 관리 =========================

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

    public List<Board> getLatestBoardPosts(SqlSessionTemplate sqlSession, String ct) {
        return sqlSession.selectList("boardMapper.getLatestBoardPosts", ct);
    }


    /**
     * 특정 게시글의 상세 내용을 조회합니다.
     */
    public Board viewDetailPage(SqlSessionTemplate sqlSession, String bno) {
        return sqlSession.selectOne("boardMapper.viewDetailPage", bno);
    }
    
    public List<Board> getPostsByUserNo(SqlSessionTemplate sqlSession, String userNo) {
        return sqlSession.selectList("boardMapper.getPostsByUserNo", userNo);
    }
    public List<MedAnswer> getAnswersByBoardNo(SqlSessionTemplate sqlSession, String bno) {
        return sqlSession.selectList("boardMapper.getAnswersByBoardNo", bno);
    }
	public List<Board> getPostsByHosNo(SqlSessionTemplate sqlSession, String hosNo) {
		return sqlSession.selectList("boardMapper.getPostsByHosNo", hosNo);
	}
	public int insertBoardAC(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertBoardAC", b);
	}




	public Board selectBoardAC(SqlSessionTemplate sqlSession, String bno) {
		return sqlSession.selectOne("boardMapper.selectBoardAC", bno);
	}




	public int insertFileAC(SqlSessionTemplate sqlSession, BoardFile bf) {
		return sqlSession.insert("boardMapper.insertFileAC", bf);
	}



    /**
     * 새 게시글을 추가합니다.
     */
    public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
        return sqlSession.insert("boardMapper.insertBoard", b);
    }
  public int insertAnswer(SqlSessionTemplate sqlSession, MedAnswer ans) {
        
        return sqlSession.insert("boardMapper.insertAnswer", ans);
    }


    /**
     * 기존 게시글을 수정합니다.
     */
    public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
        return sqlSession.update("boardMapper.updateBoard", b);
    }

    /**
     * 게시글을 삭제합니다. (논리 삭제)
     */
    public int deleteBoard(SqlSessionTemplate sqlSession, String bno) {
        return sqlSession.update("boardMapper.deleteBoard", bno);
    }

    /**
     * 관리자에 의한 게시글 삭제 (물리 삭제)
     */
    public int adminDeleteBoard(SqlSessionTemplate sqlSession, String bno) {
        return sqlSession.delete("boardMapper.adminDeleteBoard", bno);
    }

    /**
     * 게시글을 복원합니다.
     */
    public int restoreBoard(SqlSessionTemplate sqlSession, String bno) {
        return sqlSession.update("boardMapper.adminRestoreBoard", bno);
    }

    // ========================= 첨부파일 관리 =========================

    /**
     * 첨부파일 정보를 추가합니다.
     */
    public int insertFile(SqlSessionTemplate sqlSession, BoardFile bf) {
        return sqlSession.insert("boardMapper.insertFile", bf);
    }

    /**
     * 특정 게시글에 첨부된 파일 목록을 조회합니다.
     */
    public List<BoardFile> getFilesList(SqlSessionTemplate sqlSession, String bno) {
        return sqlSession.selectList("boardMapper.getFilesList", bno);
    }

    /**
     * 특정 첨부파일 정보를 조회합니다.
     */
    public BoardFile getSingleFile(SqlSessionTemplate sqlSession, String fileNo) {
        return sqlSession.selectOne("boardMapper.getSingleFile", fileNo);
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

       /**
     * 특정 게시글의 첨부파일을 모두 삭제합니다.
     */
    public int deleteAllFilesByBoardNo(SqlSessionTemplate sqlSession, String bno) {
        return sqlSession.delete("boardMapper.deleteAllFilesByBoardNo", bno);
    }
    // ========================= 댓글 관리 =========================

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

    public int deleteCommentsByBoardNo(SqlSessionTemplate sqlSession, String bno) {
        return sqlSession.delete("boardMapper.deleteCommentsByBoardNo", bno);
    }
    // ========================= 조회수 관리 =========================

    /**
     * 특정 게시글의 조회수를 증가시킵니다.
     */
    public int increaseCount(SqlSessionTemplate sqlSession, String bno) {
        return sqlSession.update("boardMapper.increaseCount", bno);
    }

    // ========================= 좋아요/싫어요 관리 =========================

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

    /**
     * 특정 댓글의 좋아요/싫어요를 업데이트합니다.
     */
    public void updateLikeDislike(SqlSessionTemplate sqlSession, String commentNo, String userNo, int isLike) {
        Map<String, Object> params = new HashMap<>();
        params.put("commentNo", commentNo);
        params.put("userNo", userNo);
        params.put("isLike", isLike);
        sqlSession.update("boardMapper.updateLikeDislike", params);
    }

    // ========================= 카테고리 관리 =========================

    /**
     * 카테고리 이름을 조회합니다.
     */
    public String getCategoryNameById(SqlSessionTemplate sqlSession, String categoryId) {
        return sqlSession.selectOne("boardMapper.getCategoryNameById", categoryId);
    }

    /**
     * 카테고리별 게시글 목록을 페이징 처리하여 조회합니다.
     */
    public ArrayList<Board> selectListByCategory(SqlSessionTemplate sqlSession, String categoryId, PageInfo pi, String sortType) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        Map<String, Object> params = new HashMap<>();
        params.put("categoryId", categoryId);
        params.put("startRow", offset + 1);
        params.put("endRow", offset + pi.getBoardLimit());
        params.put("sortType", sortType);

        return (ArrayList) sqlSession.selectList("boardMapper.selectListByCategory", params);
    }

    /**
     * 전체 카테고리 목록을 조회합니다.
     */
    public List<BoardCategory> selectList(SqlSessionTemplate sqlSession) {
        return sqlSession.selectList("boardMapper.selectAllCategories");  
    }

    // ========================= 기타 기능 =========================

    /**
     * 특정 게시글의 이전 게시글 번호를 조회합니다.
     */
    public String getPreviousBoard(SqlSessionTemplate sqlSession, String bno) {
        return sqlSession.selectOne("boardMapper.getPreviousBoard", bno);
    }

    /**
     * 특정 게시글의 다음 게시글 번호를 조회합니다.
     */
    public String getNextBoard(SqlSessionTemplate sqlSession, String bno) {
        return sqlSession.selectOne("boardMapper.getNextBoard", bno);
    }

    /**
     * 특정 사용자가 작성한 게시글 목록을 조회합니다.
     */
    public List<Board> selectUserBoards(SqlSessionTemplate sqlSession, String userNo) {
        return sqlSession.selectList("boardMapper.selectUserBoards", userNo);
    }

    /**
     * 특정 사용자가 작성한 댓글 목록을 조회합니다.
     */
    public List<Comment> selectUserComments(SqlSessionTemplate sqlSession, String userNo) {
        return sqlSession.selectList("boardMapper.selectUserComments", userNo);
    }

    /**
     * 질의응답 게시글에 대한 답변을 추가합니다.
     */
    public int insertMedAnswer(SqlSessionTemplate sqlSession, MedAnswer medAnswer) {
        return sqlSession.insert("boardMapper.insertMedAnswer", medAnswer);
    }

    /**
     * 질의응답 게시글에 대한 답변을 수정합니다.
     */
    public int updateMedAnswer(SqlSessionTemplate sqlSession, MedAnswer medAnswer) {
        return sqlSession.update("boardMapper.updateMedAnswer", medAnswer);
    }

    /**
     * 질의응답 게시글에 대한 답변을 삭제합니다.
     */
    public int deleteMedAnswer(SqlSessionTemplate sqlSession, String medAnswerId) {
        return sqlSession.delete("boardMapper.deleteMedAnswer", medAnswerId);
    }


}
