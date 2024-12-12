package com.project.trinity.community.board.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.trinity.community.board.model.dao.BoardDao;
import com.project.trinity.community.board.model.vo.Board;
import com.project.trinity.community.board.model.vo.BoardCategory;
import com.project.trinity.community.board.model.vo.BoardFile;
import com.project.trinity.community.board.model.vo.Comment;
import com.project.trinity.community.board.model.vo.Like;
import com.project.trinity.community.board.model.vo.MedAnswer;
import com.project.trinity.community.common.vo.PageInfo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {

    private final SqlSessionTemplate sqlSession;
    private final BoardDao boardDao;

    // 게시글 관련 메서드
    @Override
    public int selectListCount() {
        // 게시글 총 개수 조회
        return boardDao.selectListCount(sqlSession);
    }

    @Override
    public int selectCountCategoryList(String type) {
        // 특정 카테고리 게시글 개수 조회
        return boardDao.selectCountCategoryList(sqlSession, type);
    }

    @Override
    public Board viewDetailPage(String bno) {
        // 게시글 상세보기
        return boardDao.viewDetailPage(sqlSession, bno);
    }

    @Override
    public int insertBoard(Board b, String userNo) {
        // 게시글 작성
        b.setUserNo(userNo); // 작성자 설정
        return boardDao.insertBoard(sqlSession, b);
    }

    @Transactional(rollbackFor = {Exception.class})
    @Override
    public int updateBoard(Board b, ArrayList<BoardFile> newFiles) {
        // 게시글 수정 (첨부파일 포함)
        int boardUpdateResult = boardDao.updateBoard(sqlSession, b);
        if (boardUpdateResult <= 0) {
            throw new RuntimeException("게시글 수정에 실패했습니다.");
        }

        // 기존 파일 삭제 후 새 파일 등록
        if (newFiles != null && !newFiles.isEmpty()) {
            boardDao.deleteAllFilesByBoardNo(sqlSession, b.getBoardNo());
            for (BoardFile bf : newFiles) {
                int fileInsertResult = boardDao.insertFile(sqlSession, bf);
                if (fileInsertResult < 0) {
                    throw new RuntimeException("첨부파일 등록에 실패했습니다.");
                }
            }
        }
        return boardUpdateResult;
    }

    @Transactional(rollbackFor = {Exception.class})
    @Override
    public int adminDeleteBoard(String bno) {
        // 관리자 권한으로 게시글 삭제 (댓글 및 파일도 삭제)
        boardDao.deleteAllFilesByBoardNo(sqlSession, bno);
        boardDao.deleteCommentsByBoardNo(sqlSession, bno);
        int boardDeleteResult = boardDao.adminDeleteBoard(sqlSession, bno);
        if (boardDeleteResult <= 0) {
            throw new RuntimeException("게시글 삭제에 실패했습니다.");
        }
        return boardDeleteResult;
    }

    @Override
    public int deleteBoard(String bno) {
        // 게시글 삭제
        return boardDao.deleteBoard(sqlSession, bno);
    }

    // 첨부파일 관련 메서드
    @Override
    public int insertFile(BoardFile bf) {
        // 첨부파일 등록
        return boardDao.insertFile(sqlSession, bf);
    }

    @Override
    public BoardFile getSingleFile(String fileNo) {
        // 특정 첨부파일 조회
        return boardDao.getSingleFile(sqlSession, fileNo);
    }

    @Override
    public List<BoardFile> getFileList(String bno) {
        // 게시글에 첨부된 파일 목록 조회
        List<BoardFile> fileList = sqlSession.selectList("boardMapper.getFileList", bno);
        return fileList;
    }

    @Override
    public int deleteFile(String fileNo) {
        // 첨부파일 삭제
        return boardDao.deleteFile(sqlSession, fileNo);
    }

    @Override
    public int deleteAllFilesByBoardNo(String bno) {
        // 게시글에 첨부된 모든 파일 삭제
        return boardDao.deleteAllFilesByBoardNo(sqlSession, bno);
    }

    @Override
    public int updateFileAllowDownload(BoardFile bf) {
        // 첨부파일 다운로드 허용 여부 수정
        return boardDao.updateFileAllowDownload(sqlSession, bf);
    }

    // 댓글 관련 메서드
    @Override
    public ArrayList<Comment> selectReply(String bno) {
        // 게시글에 대한 댓글 조회
        return boardDao.selectReply(sqlSession, bno);
    }

    @Override
    public int insertComment(Comment r) {
        // 댓글 작성
        return boardDao.insertComment(sqlSession, r);
    }

    @Override
    public int deleteComment(String commentNo) {
        // 댓글 삭제
        return boardDao.deleteComment(sqlSession, commentNo);
    }

    @Override
    public int getLikeCount(String commentNo) {
        // 댓글의 좋아요 개수 조회
        return boardDao.getLikeCount(sqlSession, commentNo);
    }

    @Override
    public int getDislikeCount(String commentNo) {
        // 댓글의 싫어요 개수 조회
        return boardDao.getDislikeCount(sqlSession, commentNo);
    }

    @Override
    public Like getCurrentLikeState(String commentNo, String userNo) {
        // 댓글에 대한 사용자의 좋아요/싫어요 상태 조회
        return boardDao.getCurrentLikeState(sqlSession, commentNo, userNo);
    }

    @Override
    public void updateLikeDislike(String commentNo, String userNo, int isLike) {
        // 좋아요/싫어요 상태 업데이트
        boardDao.updateLikeDislike(sqlSession, commentNo, userNo, isLike);
    }

    @Override
    public void deleteLikeDislike(String commentNo, String userNo) {
        // 좋아요/싫어요 상태 삭제
        boardDao.deleteLikeDislike(sqlSession, commentNo, userNo);
    }

    @Override
    public void insertLikeDislike(String commentNo, String userNo, int isLike) {
        // 좋아요/싫어요 상태 삽입
        boardDao.insertLikeDislike(sqlSession, commentNo, userNo, isLike);
    }

    @Override
    public String getCategoryNameById(String categoryId) {
        // 카테고리 ID로 카테고리명 조회
        return boardDao.getCategoryNameById(sqlSession, categoryId);
    }

    @Override
    public int getListCount(String categoryId) {
        // 카테고리별 게시글 개수 조회
        Integer count = sqlSession.selectOne("boardMapper.getListCount", categoryId);
        return count == null ? 0 : count;
    }

    @Override
    public List<Board> selectListByCategory(String categoryId, PageInfo pi, String sortType) {
        // 카테고리별 게시글 목록 조회
        return boardDao.selectListByCategory(sqlSession, categoryId, pi, sortType);
    }

    @Override
    public List<Board> getLatestBoardPosts(String ct) {
        // 최신 게시글 목록 조회
        return boardDao.getLatestBoardPosts(sqlSession, ct);
    }

 
    @Override
    public List<BoardCategory> getCategories() {
        // 카테고리 목록 조회
        return boardDao.selectList(sqlSession);
    }

    @Override
    public String getPreviousBoard(String bno) {
        // 이전 게시글 번호 조회
        return boardDao.getPreviousBoard(sqlSession, bno);
    }

    @Override
    public String getNextBoard(String bno) {
        // 다음 게시글 번호 조회
        return boardDao.getNextBoard(sqlSession, bno);
    }

    @Override
    public int restoreBoard(String bno) {
        // 삭제된 게시글 복구
        return boardDao.restoreBoard(sqlSession, bno);
    }

    @Override
    public List<Board> getPostsByUserNo(String userNo) {
        // 특정 사용자 작성 게시글 조회
        return boardDao.getPostsByUserNo(sqlSession, userNo);
    }

    @Override
    public List<MedAnswer> getAnswersByBoardNo(String bno) {
        // 게시글에 달린 의학적 답변 조회
        return boardDao.getAnswersByBoardNo(sqlSession, bno);
    }

    @Override
    public int saveAnswer(MedAnswer ans) {
        // 의학적 답변 저장
        return boardDao.insertAnswer(sqlSession, ans);
    }

    @Override
    public List<Board> getPostsByHosNo(String hosNo) {
        // 특정 병원 작성 게시글 조회
        return boardDao.getPostsByHosNo(sqlSession, hosNo);
    }

    @Override
    public int insertBoardAC(Board b) {
        // 게시글 AC(인증) 작성
        return boardDao.insertBoardAC(sqlSession, b);
    }

    @Override
    public Board selectBoardAC(String bno) {
        // 게시글 AC(인증) 상세 조회
        return boardDao.selectBoardAC(sqlSession, bno);
    }

    @Override
    public int insertFileAC(BoardFile bf) {
        // 게시글 AC(인증) 파일 첨부
        return boardDao.insertFileAC(sqlSession, bf);
    }

	@Override
	public int increaseCount(String bno) {
		// TODO Auto-generated method stub
		return 0;
	}
}
