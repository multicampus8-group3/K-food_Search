package com.campus.myapp.controller;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.adminPageNationService;
import com.campus.myapp.vo.PagingVO;

@RestController
public class AdminController {
	// 관리자페이지로 이동
	@GetMapping("/admin/adminPage")
	public ModelAndView adminPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/adminPage");
		return mav;
	}
	
}
