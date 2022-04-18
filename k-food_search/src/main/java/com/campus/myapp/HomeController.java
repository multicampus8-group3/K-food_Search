package com.campus.myapp;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.countryService;
import com.campus.myapp.vo.countryVO;

@Controller
public class HomeController {
	@Inject
	countryService countryService;
	
	@RequestMapping("/")
	public String Home() {
		//return "home_main";
		return "home";
	}
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
	public ModelAndView restaurantDesignTest() {
		ModelAndView mav = new ModelAndView();
		List<countryVO> countrylist = countryService.countryList();
		mav.addObject("countrylist", countrylist);
		mav.setViewName("restaurant/restaurantDesignTest");
		return mav; 
	}
}