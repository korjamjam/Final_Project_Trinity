package com.project.trinity.member.model.vo;

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
public class Rankup {
    private int seqNo;           // SEQ_NO
    private String userNo;       // USER_NO
    private String resTitle;     // RES_TITLE
    private String subject;      // SUBJECT
    private String licPicture;   // LIC_PICTURE
    private String status;       // STATUS
    private String userName;     // USER_NAME
}