package com.project.trinity.community.board.model.vo;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class MedAnswer {

    private String answerNo;          // 답글 고유 ID
    private String boardNo;           // 원본 게시글 번호
    private String userNo;            // 답글 작성자 (USER_NO)
    private String answerContent;     // 답글 내용
    private String enrollDate;          // 답글 작성일
    private String modifiedDate;        // 답글 수정일
    private String status;            // 답글 상태 (Y: 활성, N: 비활성)
    private String isMedicalField;    // 의료 전문가 여부 (Y: 의사, N: 일반 사용자)

}
