package com.project.trinity.doctor.model.vo;

public class DoctorApplication {
    private String userNo;
    private String rTitle;  // MyBatis에서 기대하는 필드 이름과 일치
    private String subject;
    private String licPicture;

    // Getter/Setter
    public String getUserNo() {
        return userNo;
    }

    public void setUserNo(String userNo) {
        this.userNo = userNo;
    }

    public String getrTitle() {
        return rTitle; // Getter 메서드 이름이 필드 이름과 맞아야 함
    }

    public void setrTitle(String rTitle) {
        this.rTitle = rTitle;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getLicPicture() {
        return licPicture;
    }

    public void setLicPicture(String licPicture) {
        this.licPicture = licPicture;
    }
}

