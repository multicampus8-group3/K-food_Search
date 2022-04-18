package com.campus.myapp;


import java.util.List;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.countryService;
import com.campus.myapp.vo.countryVO;

import com.campus.myapp.service.BestMenuService;
import com.campus.myapp.service.RestaurantService;
import com.campus.myapp.service.mainAdService;


@Controller
public class HomeController {

	@Inject
	countryService countryService;
	@Inject
	BestMenuService bmservice;
	@Inject
	mainAdService mainadservice;
	@Inject
	RestaurantService resservice;

	@RequestMapping("/")
	public ModelAndView home() {
	   ModelAndView mav=new ModelAndView();
	   mav.addObject("bmgrade",bmservice.bmSelect());
	   mav.addObject("mainadbanner",mainadservice.mainAdSelect());
	   mav.setViewName("home");
	   return mav;
	}
	// 源��옄�쁺- 硫붿씤�럹�씠吏� top_res ad_banner
	
	@RequestMapping("/restaurant")
	public String restaurant() {
		return "restaurant/restaurant"; 
	}
	@RequestMapping("/restaurantInfo")
	public String restaurantInfo() {
		return "restaurant/restaurantInfo"; 
	}
	// �떇�떦 紐⑸줉 寃뚯떆�뙋 �뵒�옄�씤 �뀒�뒪�듃�슜
	@RequestMapping("/restaurantDesignTest")
	public ModelAndView restaurantDesignTest() {
		ModelAndView mav = new ModelAndView();
		List<countryVO> countrylist = countryService.countryList();
		mav.addObject("countrylist", countrylist);
		mav.setViewName("restaurant/restaurantDesignTest");
		return mav; 
	}
}