package com.project.trinity.community.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Reply {
    private String commentNo; // 댓글 번호
    private String refBno;    // 게시글 번호 (BOARD_NO)
    private String userNo;    // 사용자 번호
    private String replyWriter; // 댓글 작성자 (MEMBER 테이블에서 조인)
    private String replyContent; // 댓글 내용
    private String createDate;   // 댓글 작성일
    private int likeCount;       // 좋아요 수 (LIKE 테이블에서 조인)

}