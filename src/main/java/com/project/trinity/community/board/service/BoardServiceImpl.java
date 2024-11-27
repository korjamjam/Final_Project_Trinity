package com.project.trinity.community.board.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.trinity.community.board.model.dao.BoardDao;
import com.project.trinity.community.board.model.vo.Board;
import com.project.trinity.community.board.model.vo.BoardFile;
import com.project.trinity.community.board.model.vo.Reply;
import com.project.trinity.community.common.vo.PageInfo;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private final SqlSessionTemplate sqlSession;

	@Autowired
	private final BoardDao boardDao;

	// 게시글 총 갯수
	@Override
	public int selectListCount() {
		return boardDao.selectListCount(sqlSession);
	}

	// 조회수 증가
	@Override
	public int increaseCount(String bno) {
		return boardDao.increaseCount(sqlSession, bno);
	}

	// 게시글 목록 조회
	@Override
	public ArrayList<Board> selectList(PageInfo pi, String sortType) {
		return boardDao.selectList(sqlSession, pi, sortType);
	}
	
	//7일이내에 인기글 목록 조회
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

	// 게시글 상세 조회
	@Override
	public Board selectBoard(String bno) {
		return boardDao.selectBoard(sqlSession, bno);
	}

	// 게시글 작성
	@Override
	public int insertBoard(Board b, String userNo) {
		b.setUserNo(userNo); // 로그인한 사용자의 userNo 설정
		return boardDao.insertBoard(sqlSession, b);
	}

	// 첨부파일 추가
	@Override
	public int insertFile(BoardFile bf) {
		return boardDao.insertFile(sqlSession, bf);
	}

	@Override
	public BoardFile getSingleFile(String fileNo) {
		// DAO를 통해 단일 파일 정보 가져오기
		return boardDao.getSingleFile(sqlSession, fileNo);
	}

	// 특정 게시글의 모든 첨부파일 목록 조회
	@Override
	public ArrayList<BoardFile> getFilesList(String bno) {
		return boardDao.getFilesList(sqlSession, bno);
	}

	// 특정 파일 삭제
	@Override
	public int deleteFile(String fileNo) {
		return boardDao.deleteFile(sqlSession, fileNo);
	}

	@Override
	public int deleteAllFilesByBoardNo(String boardNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateFileAllowDownload(BoardFile bf) {
		return boardDao.updateFileAllowDownload(sqlSession, bf);
	}

	// 다운로드 허용 여부 업데이트
	public int updateAllowDownload(SqlSessionTemplate sqlSession, String fileNo, String allowDownload) {
		BoardFile bf = new BoardFile();
		bf.setFileNo(fileNo); // 파일 번호 설정
		bf.setAllowDownload(allowDownload); // BoardFile 객체의 allowDownload 설정
		return sqlSession.update("boardMapper.updateAllowDownload", bf);
	}

	// 특정 게시글의 다운로드 허용 여부 조회
	public String selectAllowDownload(SqlSessionTemplate sqlSession, String bno) {
		return sqlSession.selectOne("boardMapper.selectAllowDownload", bno);
	}

	// 게시글 수정
	@Override
	public int updateBoard(Board b) {
		return boardDao.updateBoard(sqlSession, b);
	}

	// 게시글 삭제
	@Override
	public int deleteBoard(String bno) {
		return boardDao.deleteBoard(sqlSession, bno);
	}

	@Override
	public ArrayList<Reply> selectReply(String bno) {
		return boardDao.selectReply(sqlSession, bno);
	}

	@Override
	public int insertReply(Reply r) {
		return boardDao.insertReply(sqlSession, r);
	}

	@Override
	public ArrayList<Board> selectTopBoardList() {
		return boardDao.selectTopBoardList(sqlSession);
	}
	
	// 좋아요 상태 변경
	@Override
	public int toggleLike(String commentNo, String userNo) {
	    System.out.println("toggleLike 호출 - commentNo: " + commentNo + ", userNo: " + userNo);
	    try {
	        int isLiked = boardDao.checkLike(sqlSession, commentNo, userNo);
	        System.out.println("현재 좋아요 상태: " + isLiked);

	        if (isLiked > 0) {
	            int result = boardDao.deleteLike(sqlSession, commentNo, userNo);
	            System.out.println("좋아요 삭제 결과: " + result);
	            return 0;
	        } else {
	            int result = boardDao.insertLike(sqlSession, commentNo, userNo);
	            System.out.println("좋아요 추가 결과: " + result);
	            return 1;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        System.out.println("예외 발생: " + e.getMessage());
	        return -1; // 예외 발생 시 처리
	    }
	}



    // 특정 댓글의 좋아요 수 가져오기
    @Override
    public int getLikeCount(String commentNo) {
        return boardDao.getLikeCount(sqlSession, commentNo); // 좋아요 수 조회
    }
	
	@Override
	public int deleteReply(String commentNo) {
	    return boardDao.deleteReply(sqlSession, commentNo);
	}

	
	@Override
	public ArrayList<Board> selectPopularList(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return null;
	}

}
