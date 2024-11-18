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

@Data // @Getter, @Setter, @ToString, @EqualsAndHashCode, @RequiredArgsConstructor 포함
@NoArgsConstructor
@AllArgsConstructor
public class Board {

    private String boardNo;  
    private int boardType;// 게시글 고유 번호
    private String userNo;              // 작성자의 고유 식별 번호 (DB 상의 ID)
    private String boardTitle;            // 제목
    private String boardContent;          // 내용
    private Date enrollDate;        // 작성일
    private Date modifiedDate;       // 수정일    
    private int boardViews;               // 조회수
    private String boardCategory;    // 게시판 카테고리 (예: 자유, 메디톡, 이벤트)
    private String boardWriter;      // 작성자 ID (아이디나 이름을 저장)
    private String originName;       // 원본 파일 이름
    private String changeName;       // 변경된 파일 이름
    private String status;           // 상태 (예: 'Y' or 'N')
}
