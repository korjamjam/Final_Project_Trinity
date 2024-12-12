package com.project.trinity.inquiry.model.service;

import java.util.List;

import com.project.trinity.board.common.vo.PageInfo;
import com.project.trinity.community.model.vo.Community;
import com.project.trinity.inquiry.model.vo.Inquiry;





public interface InquiryService {

	   int getListCount(String categoryId);

	List<Inquiry> selectListByCategory(String categoryId, PageInfo pi, String sortType);


	Inquiry viewDetailPageWithCount(String ino);

	List<Community> getLatestInquiryPosts(String ct);
   
}