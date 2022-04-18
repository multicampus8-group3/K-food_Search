package com.campus.myapp;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.BestMenuService;
import com.campus.myapp.service.mainAdService;

@Controller
public class HomeController {
	// 김자영- 메인페이지 top_res ad_banner에 사용
	@Inject
	BestMenuService bmservice;
	@Inject
	mainAdService mainadservice;
	@RequestMapping("/")
	public ModelAndView home() {
	   ModelAndView mav=new ModelAndView();
	   mav.addObject("bmgrade",bmservice.bmSelect());
	   mav.addObject("mainadbanner",mainadservice.mainAdSelect());
	   mav.setViewName("home");
	   return mav;
	}
	// 김자영- 메인페이지 top_res ad_banner
	
	@RequestMapping("/restaurant")
	public String restaurant() {
		return "restaurant/restaurant"; 
	}
	@RequestMapping("/restaurantInfo")
	public String restaurantInfo() {
		return "restaurant/restaurantInfo"; 
	}
	// 식당 목록 게시판 디자인 테스트용
	@RequestMapping("/restaurantDesignTest")
	public String restaurantDesignTest() {
		return "restaurant/restaurantDesignTest"; 
	}
}