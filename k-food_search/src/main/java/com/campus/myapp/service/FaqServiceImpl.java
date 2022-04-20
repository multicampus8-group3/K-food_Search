package com.campus.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campus.myapp.dao.FaqDAO;
import com.campus.myapp.vo.FaqAnswerVO;
import com.campus.myapp.vo.FaqVO;

@Service
public class FaqServiceImpl implements FaqService {
	@Autowired
	FaqDAO dao;
	
	@Override
	public int faqMake(FaqVO vo) {
		return dao.faqMake(vo);
	}

	@Override
	public List<FaqVO> faqList(FaqVO vo) {
		return dao.faqList(vo);
	}

	@Override
	public int faqDel(int no) {
		return dao.faqDel(no);
	}

	@Override
	public int faqAnswerInsert(int resno, int faqno, String content) {
		// TODO Auto-generated method stub
		return dao.faqAnswerInsert(resno, faqno, content);
	}

	@Override
	public List<FaqAnswerVO> faqAnswerUpdateList(int resno) {
		// TODO Auto-generated method stub
		return dao.faqAnswerUpdateList(resno);
	}

	@Override
	public int faqAnswerDel(int resno) {
		// TODO Auto-generated method stub
		return dao.faqAnswerDel(resno);
	}

	@Override
	public List<FaqAnswerVO> faqSelect(int resno) {
		return dao.faqSelect(resno);
	}
}
