package com.campus.myapp.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.campus.myapp.service.RestaurantService;
import com.campus.myapp.vo.RestaurantVO;

@RestController
@RequestMapping("/restaurant/*")
public class RestaurantController {
	@Inject
	RestaurantService service;
	
	// 관리자페이지에서 가게목록 보기
	@GetMapping("listtoadmin")
	public List<RestaurantVO> list(RestaurantVO vo) {
		return service.restaurantList(vo);
	}
}
