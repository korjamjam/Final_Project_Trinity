package com.project.trinity.inquiry.service;

import java.util.List;


import com.project.trinity.community.common.vo.PageInfo;
import com.project.trinity.inquiry.vo.Inquiry;





public interface InquiryService {

	String getCategoryNameById(String categoryId);

	int getListCount(String categoryId);

	List<Inquiry> selectListByCategory(String categoryId, PageInfo pi, String sortType);
   
}