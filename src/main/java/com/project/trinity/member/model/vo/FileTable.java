package com.project.trinity.member.model.vo;

public class FileTable {
    private String userId;    // 사용자 ID
    private String filePath;  // 프로필 이미지 경로

    // Getter/Setter
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }
}

