package com.project.trinity.community.common.template;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.project.trinity.community.common.vo.PageInfo;

public class Template {

	/**
	 * 
	 * @param listCount : 총 게시글 수
	 * @param currentPage : 현재페이지
	 * @param boardLimit : 한 페이지에 보여질 게시글 최대 수
	 * @return PageInfo
	 */
	//listCount : 처음은 무조건 1
	//currentPage : 처음은 무조건 1
	//
	public static PageInfo getPageInfo(int listCount, int currentPage, int boardLimit) {
		int maxPage = (int)Math.ceil((double)listCount/boardLimit); // 가장 마지막 페이지
		int startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1; // 페이징바의 시작
		int endPage = startPage + pageLimit - 1; //페이징바의 마지막
		
		endPage = endPage > maxPage ? maxPage : endPage;
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		return pi;
	}
}