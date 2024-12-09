package com.project.trinity.community.board.model.vo;

import java.util.Date;

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
public class Comment {
    private String commentNo;     // 댓글 번호
    private String refBno;        // 게시글 번호 (BOARD_NO)
    private String userNo;        // 사용자 번호
    private String commentWriter; // 댓글 작성자 (MEMBER 테이블에서 조인)
    private String commentContent;// 댓글 내용
    private Date createDate;    // 댓글 작성일
    private int likeCount;        // 좋아요 수 (LIKE 테이블에서 조인)
    private int dislikeCount;     // 싫어요 수 (DISLIKE 테이블에서 조인)
    private boolean isLiked;      // 사용자가 이 댓글에 좋아요를 눌렀는지 여부
    private boolean isDisliked;   // 사용자가 이 댓글에 싫어요를 눌렀는지 여부
}
