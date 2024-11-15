package com.project.trinity.reservation.model.vo;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class Reservation {
    private int resNo;
    private int userNo; // USER_NO 필드 추가
    private String hosNo;
    private Date resDate;
    private Date resTime;
    private String resCategory;
    private String resContent;
    private String vaccineCategory;
}
