package com.project.trinity.community.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {

    private String boardNo;               // 게시글 번호
    private int boardType;                // 게시글 유형(일반 : 1 / 사진 : 2)
    private String boardTitle;            // 게시글 제목
    private String tag;                   // 태그
    private String userNo;                // 작성자의 고유 번호
    private String boardWriter;           // 작성자의 ID
    private String boardContent;          // 게시글 내용
    private String enrollDate;            // 등록일
    private String modifiedDate;          // 수정일
    private int boardViews;               // 조회수
    private String status;                // 상태 (Y/N)
    private String categoryId;  // 카테고리 ID만 필요
    private String categoryName;    
    // 첨부파일 목록
    private ArrayList<BoardFile> fileList; // 특정 게시글의 첨부파일 정보
    private String inquiryCategory;
}
