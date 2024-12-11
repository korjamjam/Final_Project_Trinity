package com.project.trinity.community.board.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardFile {
    private String fileNo;        // FILE_NO
    private String boardNo;       // BOARD_NO
    private String userNo;        // USER_NO
    private String originName;    // ORIGIN_NAME
    private String changeName;    // CHANGE_NAME
    private String allowDownload; // ALLOW_DOWNLOAD
    private long fileSize;        // FILE_SIZE
    private String hosName;
}
