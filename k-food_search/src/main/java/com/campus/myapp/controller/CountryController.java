package com.campus.myapp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.RestaurantService;
import com.campus.myapp.service.countryService;
import com.campus.myapp.vo.RestaurantVO2;
import com.campus.myapp.vo.countryVO;
import com.campus.myapp.vo.memberVO;

@Controller
//@RestController
public class CountryController {
	@Inject
	countryService service;
	@Inject
	RestaurantService res_service;
	/*
	@GetMapping("/country_rest")
	public List<RestaurantVO2> country_rest(@RequestParam("code") int code) {
		//占쏙옙占쏙옙 占쏙옙占쌔쇽옙 List占쌨아울옙占쏙옙
		List<RestaurantVO2> arr=new ArrayList<>();
		arr.add(new RestaurantVO2(code+"","占쏙옙占쏙옙","占쏙옙크占쏙옙","占싼쇽옙"));
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
	
	@GetMapping("/stateList")
	@ResponseBody
	public List<countryVO> stateList(String nation){
		return service.stateList(nation);
	}
	
	//home_word 테스트
	@GetMapping("/shop_test") // "/restaurantList_default?nation=${mvo.favornation}" 주소값 등록시 이쪽으로 값 넘어옴.
	public ModelAndView restaurantList_default(String nation, HttpSession session) {//매개변수로 member_table의 favoernation을 가져옴
		ModelAndView mav = new ModelAndView();
		//mav.addObject("mVO", mVO); //가입한 고객의 선호지역을 기반으로 레스토랑 정보 전부 가져옴.
		String userid = (String)session.getAttribute("logId");
		if(userid==null) {
			mav.addObject("list", res_service.restaurantList_world(nation));
		}/*else {
			String favorNation = (String)session.getAttribute("favorNation");
			System.out.println(favorNation);
			mav.addObject("list", res_service.restaurantList_world(favorNation));
		}*/
		mav.setViewName("/shop_test");
		return mav;
	}
}
