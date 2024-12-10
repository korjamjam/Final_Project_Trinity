package com.project.trinity.reservation.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CountReservation {
	private String startTime;        	// 예약 날짜
    private String endTime;        	// 예약 시간
    private String count;			// 예약자 수
}
