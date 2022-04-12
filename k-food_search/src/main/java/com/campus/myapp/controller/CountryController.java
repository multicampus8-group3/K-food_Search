package com.campus.myapp.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.campus.myapp.vo.RestaurantVO2;

@RestController
public class CountryController {

	/*
	@GetMapping("/country_rest")
	public List<RestaurantVO2> country_rest(@RequestParam("code") int code) {
		//서비스 통해서 List받아오기
		List<RestaurantVO2> arr=new ArrayList<>();
		arr.add(new RestaurantVO2(code+"","가나","아크라","한솥"));
		return arr;
	}
	*/
	@GetMapping("/country_rest")
	public List<RestaurantVO2> country_rest(
				@RequestParam("nation") String nation,
				@RequestParam("state") String state
			) {
		List<RestaurantVO2> arr=new ArrayList<>();
		arr.add(new RestaurantVO2("goguma",nation,state));
		return arr;
	}
}
