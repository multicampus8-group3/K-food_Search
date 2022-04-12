package com.campus.myapp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping("/")
	public String Home() {
		return "home_main";
	}
	@RequestMapping("/restaurant")
	public String restaurant() {
		return "restaurant/restaurant"; 
	}
	@RequestMapping("/restaurantInfo")
	public String restaurantInfo() {
		return "restaurant/restaurantInfo"; 
	}
}