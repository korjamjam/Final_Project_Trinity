package com.project.trinity.community.board.model.vo;

import com.project.trinity.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.ToString;
import lombok.Data;

import java.util.Date;

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
    private String boardViews;     // 조회수
    private String boardCategory;  // 게시글 카테고리
    private String status;         // 상태 (Y/N)
}



