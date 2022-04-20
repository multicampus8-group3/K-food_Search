package com.campus.myapp;


import java.util.List;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.countryService;
import com.campus.myapp.vo.ResPagingVO;
import com.campus.myapp.vo.RestaurantVO;
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
	// 김자영- 메인페이지 top_res ad_banner
	
	@RequestMapping("/restaurant")
	public String restaurant() {
		return "restaurant/restaurant"; 
	}
	@RequestMapping("/restaurantInfo")
	public String restaurantInfo() {
		return "restaurant/restaurantInfo"; 
	}
	
	//디자인테스트 
	// 식당 목록 게시판 디자인 테스트
	@RequestMapping("/restaurantDesignTest")
	public ModelAndView restaurantDesignTest(ResPagingVO pVO, String nation, String resty) {
		ModelAndView mav = new ModelAndView();
		List<countryVO> countrylist = countryService.countryList();
		List<RestaurantVO> restList = null;
		if(nation!=null) {
			restList=countryService.restListByNation(nation);
		}
		if(resty!=null) {
			restList=countryService.restListRestype(resty);
		}
		mav.addObject("countrylist", countrylist);
		mav.addObject("restList", restList);
		mav.addObject("nation",nation);
		//System.out.println(restList);
		pVO.setTotalRecord(resservice.totalRecord(pVO));
		mav.addObject("pVO", pVO);
		mav.setViewName("/restaurant/restaurantDesignTest");
		return mav; 
	}
	
	/*
	// 식당 목록 게시판 디자인 테스트용
	@RequestMapping("/restaurantDesignTest")
	public ModelAndView restaurantDesignTest(String nation, String resty) {
		ModelAndView mav = new ModelAndView();
		List<countryVO> countrylist = countryService.countryList();
		List<RestaurantVO> restList = null;
		if(nation!=null) {
			restList=countryService.restListByNation(nation);
		}
		if(resty!=null) {
			restList=countryService.restListRestype(resty);
		}
		mav.addObject("countrylist", countrylist);
		mav.addObject("restList", restList);
		mav.addObject("nation",nation);
		System.out.println(restList);
		mav.setViewName("restaurant/restaurantDesignTest");
		return mav; 
	}
	 * */
	
}