package com.project.trinity.community.model.vo;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Like {
    private String commentNo;  // 댓글 번호
    private String userNo;     // 사용자 번호
    private int isLike;    // 좋아요 상태 (true: 좋아요, false: 싫어요)
    private String enrollDate;   // 등록일
}
