package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.FaqAnswerVO;
import com.campus.myapp.vo.FaqVO;

@Mapper
@Repository
public interface FaqDAO {
	// 관리자페이지에서 FAQ등록
	public int faqMake(FaqVO vo);
	// 관리자페이지에서 FAQ목록 보기
	public List<FaqVO> faqList(FaqVO vo);
	// 관리자페이지에서 FAQ삭제
	public int faqDel(int no);
	public int faqAnswerInsert(int resno, int faqno, String content);
	public List<FaqAnswerVO> faqAnswerUpdateList(int resno);
	public int faqAnswerDel(int resno);
}
