package com.project.trinity.board.common.vo;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Data
@NoArgsConstructor  // 기본 생성자 자동 생성
@AllArgsConstructor // 모든 필드를 받는 생성자 자동 생성
public class PageInfo {
    private int listCount;
    private int currentPage;
    private int pageLimit;
    private int boardLimit;
    private int maxPage;
    private int startPage;
    private int endPage;
    private int startRow;
    private int endRow;

    // startRow와 endRow 계산
    public void calculatePageRows() {
        this.startRow = (this.currentPage - 1) * this.boardLimit + 1;
        this.endRow = this.startRow + this.boardLimit - 1;
    }
}


