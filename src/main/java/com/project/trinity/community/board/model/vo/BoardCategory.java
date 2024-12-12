package com.project.trinity.community.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardCategory {

    private String categoryId;     // 카테고리 고유 ID
    private String categoryName;   // 카테고리 이름
    private int sortOrder;         // 정렬 순서
    private String isActive;       // 활성화 여부 (Y/N)
    
}
