package com.project.trinity.inquiry.model.service;

import java.util.List;

import com.project.trinity.community.board.model.vo.Board;
import com.project.trinity.community.common.vo.PageInfo;
import com.project.trinity.inquiry.model.vo.Inquiry;





public interface InquiryService {

	   int getListCount(String categoryId);

	List<Inquiry> selectListByCategory(String categoryId, PageInfo pi, String sortType);


	Inquiry viewDetailPageWithCount(String ino);

	List<Board> getLatestInquiryPosts(String ct);

	String getPreviousBoard(String ino); // 이전 게시글 조회
    String getNextBoard(String ino); // 다음 게시글 조회
   
}