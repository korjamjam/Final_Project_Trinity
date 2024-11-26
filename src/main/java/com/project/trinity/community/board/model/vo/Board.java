package com.project.trinity.community.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {

    private String boardNo;        // 게시글 번호
    private int boardType;         // 게시글 유형
    private String boardTitle;     // 게시글 제목
    private String userNo;         // 작성자의 고유 번호 (로그인 사용자와 연결)
    private String boardWriter;    // 작성자의 ID (조회 시 MEMBER 테이블에서 가져옴)
    private String boardContent;   // 게시글 내용
    private String enrollDate;     // 등록일
    private String modifiedDate;   // 수정일
    private int boardViews;        // 조회수
    private String boardCategory;  // 게시글 카테고리
    private String status;         // 상태 (Y/N)
 

    // 첨부파일 목록
    private ArrayList<BoardFile> attachedFiles; // 특정 게시글의 첨부파일 정보
  
	
}