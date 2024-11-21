package com.project.trinity.community.board.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardFile {
    private String fileNo;       // 파일 고유 번호
    private String boardNo;      // 게시글 번호
    private String userNo;       // 사용자 번호
    private String originName;   // 원본 파일명
    private String changeName;   // 변경된 파일명
    private String allowDownload; // 다운로드 허용 상태 ('Y', 'N')
    private long fileSize;

}
