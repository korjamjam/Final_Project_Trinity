package com.project.trinity.community.board.service;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
		return boardDao.selectListCount(sqlSession);
	}

	// 조회수 증가 메서드
	@Override
	public int increaseCount(String bno) {
		return boardDao.increaseCount(sqlSession, bno);
	}

	@Override
	public int selectCountCategoryList(String type) {
		return boardDao.selectCountCategoryList(sqlSession, type);
	}

	@Override
	public Board selectBoard(String bno) {
		 System.out.println("서비스impl bno: " + bno);  
		return boardDao.selectBoard(sqlSession, bno);
	}

	@Override
	public int insertBoard(Board b, String userNo) {
		b.setUserNo(userNo); // 작성자 설정
		return boardDao.insertBoard(sqlSession, b);
	}

	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int updateBoard(Board b, ArrayList<BoardFile> newFiles) {
	    // 1. 게시글 내용 수정
	    int boardUpdateResult = boardDao.updateBoard(sqlSession, b);
	    if (boardUpdateResult <= 0) {
	        throw new RuntimeException("게시글 수정에 실패했습니다.");
	    }

	    // 2. 기존 파일 삭제 (첨부파일이 있을 경우)
	    if (newFiles != null && !newFiles.isEmpty()) {
	        // 기존 파일 삭제
	        boardDao.deleteAllFilesByBoardNo(sqlSession, b.getBoardNo());
	        
	     // 새 파일 등록
	        if (newFiles != null && !newFiles.isEmpty()) {
	            for (BoardFile bf : newFiles) {
	                int fileInsertResult = boardDao.insertFile(sqlSession, bf);
	                if (fileInsertResult < 0) {
	                    throw new RuntimeException("첨부파일 등록에 실패했습니다.");
	                }
	            }
	        }

	    }
	    return boardUpdateResult; // 성공적으로 수정된 게시글 갯수 반환
	}


	@Transactional(rollbackFor = {Exception.class})
	@Override
	//boardService.deleteBoard
	public int adminDeleteBoard(String bno) {
	    // 첨부파일 삭제
	    boardDao.deleteAllFilesByBoardNo(sqlSession, bno);
	   
	    // 댓글 삭제 (예시로 댓글 삭제하는 메서드)
	    boardDao.deleteCommentsByBoardNo(sqlSession, bno);
	  

	    // 게시글 삭제
	    //boardDao.deleteBoard
	    int boardDeleteResult = boardDao.adminDeleteBoard(sqlSession, bno);
	    if (boardDeleteResult <= 0) {
	        throw new RuntimeException("게시글 삭제에 실패했습니다.");
	    }
 

	    // 모든 작업이 성공하면 성공적으로 처리
	    return boardDeleteResult;
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
	public List<BoardFile> getFileList(String bno) {
		List<BoardFile> fileList  = sqlSession.selectList("boardMapper.getFileList", bno);
		if (fileList  != null) {
			for (BoardFile file : fileList ) {
				System.out.println("서비스impl 파일: " + file);
			}
		}
		return fileList ;
	}

	@Override
	public int deleteFile(String fileNo) {
		return boardDao.deleteFile(sqlSession, fileNo);
	}

	@Override
	public int deleteAllFilesByBoardNo(String bno) {
		return boardDao.deleteAllFilesByBoardNo(sqlSession, bno);
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
	public int insertComment(Comment r) {
		return boardDao.insertComment(sqlSession, r);
	}


	@Override
	public int deleteComment(String commentNo) {
		return boardDao.deleteComment(sqlSession, commentNo);
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

	@Override
	public String getCategoryNameById(String categoryId) {
		return boardDao.getCategoryNameById(sqlSession, categoryId);
	}

	@Override
	public int getListCount(String categoryId) {
		// categoryId 값 확인
		System.out.println("서비스 impl categoryId value: " + categoryId); // 여기서 categoryId 값을 출력

		// 'categoryId'를 사용하여 게시글의 총 개수를 가져오는 쿼리 실행
		Integer count = sqlSession.selectOne("boardMapper.getListCount", categoryId);

		// 쿼리 결과 확인
		if (count == null) {
			System.out.println("Query Result is null");
			return 0; // null일 경우 0을 반환
		} else {
			System.out.println("Query Result: " + count);
			return count;
		}
	}


	@Override
	public List<Board> selectListByCategory(String categoryId, PageInfo pi, String sortType) {
	    return boardDao.selectListByCategory(sqlSession, categoryId, pi, sortType);
	}
	@Override
	public List<Board> getLatestPosts(String categoryId) {
	    return boardDao.getLatestPosts(sqlSession, categoryId);
	}

	@Override
	public List<Board> selectRecentPopularList(PageInfo pi) {
		// 실시간 인기 게시글 목록을 조회
		return boardDao.selectRecentPopularList(sqlSession, pi);
	}

	@Override
	public List<BoardCategory> getCategories() {
		return boardDao.selectList(sqlSession); // DB에서 카테고리 목록을 조회
	}

	@Override
	public String getPreviousBoard(String bno) {
	    // DAO에서 이전글의 게시글 번호 조회
	    String prevBno = boardDao.getPreviousBoard(sqlSession, bno);
	    System.out.println("이전 게시글 번호: " + prevBno);
	    return prevBno;
	}

	@Override
	public String getNextBoard(String bno) {
	    // DAO에서 다음글의 게시글 번호 조회
	    String nextBno = boardDao.getNextBoard(sqlSession, bno);
	    System.out.println("다음 게시글 번호: " + nextBno);
	    return nextBno;
	}



	@Override
	public int restoreBoard(String bno) {
	    return boardDao.restoreBoard(sqlSession, bno);
	}
	
	@Override
	public List<Board> getPostsByUserNo(String userNo) {
	    return boardDao.getPostsByUserNo(sqlSession, userNo);
	}



	@Override
	public List<MedAnswer> getAnswersByBoardNo(String bno) {
	    return boardDao.selectAnswersByBoardNo(sqlSession, bno);
	}

	  @Override
	    public int saveAnswer(MedAnswer ans) {
		  System.out.println("서비스 Save Answer Debug: " + ans);
	        return boardDao.insertAnswer(sqlSession, ans);
	    }

	@Override
	public List<Board> getPostsByHosNo(String hosNo) {
		return boardDao.getPostsByHosNo(sqlSession, hosNo);
	}

	@Override
	public int insertBoardAC(Board b) {
		return boardDao.insertBoardAC(sqlSession, b);
	}

	@Override
	public Board selectBoardAC(String bno) {
		return boardDao.selectBoardAC(sqlSession, bno);
	}

	@Override
	public int insertFileAC(BoardFile bf) {
		return boardDao.insertFileAC(sqlSession, bf);
	}




}
