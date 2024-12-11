package com.project.trinity.community.board.model.vo;
import lombok.Data;
import lombok.NoArgsConstructor;



import lombok.AllArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MedAnswer {
    private String answerNo;       // 답글 고유 번호
    private String boardNo;        // 게시글 번호
    private String medNo;          // 의사 고유 번호
    private String answerContent;  // 답글 내용
    private String enrollDate;     // 답글 작성일
    private String modifiedDate;   // 답글 수정일
    private String status;         // 상태
    private String isMedicalField; // 의료 전문가 여부
    private String medicalFieldId; // 의료 분야 ID
    private String doctorName;     // 작성자 이름 추가
    private int likeCount;        // 좋아요 수 (LIKE 테이블에서 조인)
    private int dislikeCount;     // 싫어요 수 (DISLIKE 테이블에서 조인)
    private boolean isLiked;      // 사용자가 이 댓글에 좋아요를 눌렀는지 여부
    private boolean isDisliked;   // 사용자가 이 댓글에 싫어요를 눌렀는지 여부

  
}
