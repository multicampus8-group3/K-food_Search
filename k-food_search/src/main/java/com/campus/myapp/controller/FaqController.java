package com.campus.myapp.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.campus.myapp.service.FaqService;
import com.campus.myapp.vo.FaqVO;

@RestController
@RequestMapping("/faq/")
public class FaqController {
	@Inject
	FaqService service;
	
	// 관리자페이지에서 FAQ등록
	@PostMapping("faqMakeOk")
	public int faqMakeOk(FaqVO vo) {
		return service.faqMake(vo);
	}
	// 관리자페이지에서 FAQ목록 보기
	@GetMapping("listtoadmin")
	public List<FaqVO> list(FaqVO vo) {
		return service.faqList(vo);
	}
	// 관리자페이지에서 FAQ삭제
	@GetMapping("deltoadmin")
	public int delOk(int no) {
		return service.faqDel(no);
	}
}
