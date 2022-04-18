package com.campus.myapp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.countryService;
import com.campus.myapp.vo.RestaurantVO2;
import com.campus.myapp.vo.countryVO;
import com.campus.myapp.vo.memberVO;

//@Controller
@RestController
public class CountryController {
	@Inject
	countryService service;
	/*
	@GetMapping("/country_rest")
	public List<RestaurantVO2> country_rest(@RequestParam("code") int code) {
		//���� ���ؼ� List�޾ƿ���
		List<RestaurantVO2> arr=new ArrayList<>();
		arr.add(new RestaurantVO2(code+"","����","��ũ��","�Ѽ�"));
		return arr;
	}
	*/
	/*
	@GetMapping("/country_rest")
	public List<RestaurantVO2> country_rest(
				@RequestParam("nation") String nation,
				@RequestParam("state") String state
			) {
		List<RestaurantVO2> arr=new ArrayList<>();
		arr.add(new RestaurantVO2("goguma",nation,state));
		return arr;
	}
	
	@GetMapping("/country_test")
	public String country_test() {
		return "/test";
	}
	*/
	/*
	 * @GetMapping("/countryList") public List<countryVO> countryList() { return "";
	 * }
	 */
	
	@GetMapping("/country/stateList")
	public List<countryVO> stateList(String nation){
		return service.stateList(nation);
	}
	
	//home_word �׽�Ʈ
	@GetMapping("/restaurantList_default") // "/restaurantList_default?nation=${mvo.favornation}" �ּҰ� ��Ͻ� �������� �� �Ѿ��.
	public ModelAndView restaurantList_default(memberVO mVO) {//�Ű������� member_table�� favoernation�� ������
		ModelAndView mav = new ModelAndView();
		mav.addObject("mVO", mVO); //������ ���� ��ȣ������ ������� ������� ���� ���� ������. 
		mav.setViewName("restaurant/restaurantDesignTest");
		return mav;
	}
}
