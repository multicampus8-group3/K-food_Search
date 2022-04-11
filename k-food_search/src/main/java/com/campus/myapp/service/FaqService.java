package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.FaqVO;

public interface FaqService {
	// 관리자페이지에서 FAQ등록
	public int faqMake(FaqVO vo);
	// 관리자페이지에서 FAQ목록 보기
	public List<FaqVO> faqList(FaqVO vo);
	// 관리자페이지에서 FAQ삭제
	public int faqDel(int no);
}
