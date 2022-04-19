package com.campus.myapp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.RestaurantService;	
import com.campus.myapp.service.countryService;
import com.campus.myapp.vo.RestaurantVO;
import com.campus.myapp.vo.countryVO;

@Controller
//@RestController   
public class CountryController {
	@Inject
	countryService service;
	@Inject
	RestaurantService res_service;
	@GetMapping("/country/stateList")
	@ResponseBody
	public Map<String,Object> stateList(String nation){
		List<countryVO> stList=service.stateList(nation);
		List<RestaurantVO> restList=service.restListByNation(nation);
		Map<String,Object>map=new HashMap<String,Object>();
		map.put("stateList", stList);
		map.put("restList", restList);
		return map;
	}
	@GetMapping("/country/restList")
	@ResponseBody
	public List<RestaurantVO> restList(String nation, String state){
		System.out.println(nation+"/"+state);
		return service.restList(nation, state);
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
