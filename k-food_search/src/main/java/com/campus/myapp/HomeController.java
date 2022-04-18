package com.campus.myapp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
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
	public String restaurantDesignTest() {
		return "restaurant/restaurantDesignTest"; 
	}
}