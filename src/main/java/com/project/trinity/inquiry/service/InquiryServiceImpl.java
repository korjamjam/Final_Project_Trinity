package com.project.trinity.inquiry.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;



import com.project.trinity.community.common.vo.PageInfo;
import com.project.trinity.inquiry.dao.InquiryDao;
import com.project.trinity.inquiry.vo.Inquiry;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class InquiryServiceImpl implements InquiryService {
	private final SqlSessionTemplate sqlSession;
	private final InquiryDao inquiryDao;
	 
	
	@Override
	public List<Inquiry> selectListByCategory(String categoryId, PageInfo pi, String sortType) {
	    return inquiryDao.selectListByCategory(sqlSession, categoryId, pi, sortType);
	}
	@Override
	public int getListCount(String categoryId) {
		// categoryId 값 확인
		System.out.println("서비스 impl categoryId value: " + categoryId); // 여기서 categoryId 값을 출력

		// 'categoryId'를 사용하여 게시글의 총 개수를 가져오는 쿼리 실행
		Integer count = sqlSession.selectOne("inquiryMapper.getListCount", categoryId);

		// 쿼리 결과 확인
		if (count == null) {
			System.out.println("Query Result is null");
			return 0; // null일 경우 0을 반환
		} else {
			System.out.println("Query Result: " + count);
			return count;
		}
	}

	
}