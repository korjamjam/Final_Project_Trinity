package com.project.trinity.community.board.model.vo;

import com.project.trinity.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.ToString;
import lombok.Data;

import java.util.Date;

@Data // @Getter, @Setter, @ToString, @EqualsAndHashCode, @RequiredArgsConstructor 포함
@NoArgsConstructor
@AllArgsConstructor
public class Board {
    private String boardNo;
    private int boardType;       // 기본값 설정
    private String userNo;
    private String boardTitle;
    private String boardContent;
    private Date enrollDate;
    private Date modifiedDate;
    private String boardViews;      // 기본값 설정
    private String boardCategory;
    private String boardWriter;
    private String originName;
    private String changeName;
    private String status;     // 기본값 설정

    // Getters, Setters, Constructors
}

