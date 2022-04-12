package com.campus.myapp.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.FaqService;
import com.campus.myapp.service.RestaurantService;
import com.campus.myapp.vo.FaqVO;
import com.campus.myapp.vo.RestaurantVO;

@RestController
public class RestaurantController {
	@Inject
	RestaurantService service;
	@Inject
	FaqService fservice;
	
	// 관리자페이지에서 가게목록 보기
	@GetMapping("/restaurant/listtoadmin")
	@ResponseBody
	public List<RestaurantVO> list(RestaurantVO vo) {
		return service.restaurantList(vo);
	}
	@GetMapping("/myrestaurant")
	public ModelAndView myrestaurant() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/myrestaurant/restaurantMain");
		return mav;
	}
	@GetMapping("/restaurantSignUp")
	public ModelAndView restaurantSignUp() {
		ModelAndView mav = new ModelAndView();
		List<FaqVO> lst = fservice.faqList(null);
		mav.addObject("faqList",lst);
		mav.setViewName("/myrestaurant/restaurantSignUp");
		return mav;
	}
	@GetMapping("/restaurantUpdateList")
	public ModelAndView restaurantUpdate(RestaurantVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/myrestaurant/restaurantUpdateList");
		return mav;
	}
	@GetMapping("/restaurantListView")
	@ResponseBody
	public List<RestaurantVO> restaurantListView(HttpSession session){
		String userid = (String)session.getAttribute("logId");
		return service.restaurantMyList(userid);
	}
	@GetMapping("/restaurantDel")
	@ResponseBody
	public int restaurantDel(int resno) {
		return service.restaurantDel(resno);
	}
	@GetMapping("/restaurantUpdateWrite")
	public ModelAndView restaurantUpdateWrite(int resno) {
		ModelAndView mav = new ModelAndView ();
		mav.addObject("vo",service.restaurantUpdateList(resno));
		mav.setViewName("/myrestaurant/restaurantUpdateWrite");
		return mav;
	}
	@PostMapping("/resSignUp")
	public ModelAndView resSignUp (RestaurantVO vo, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView ();
		vo.setUserid((String)request.getSession().getAttribute("logId"));
		String path = request.getSession().getServletContext().getRealPath("resImg");
		System.out.println(path);
		try {
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest) request;
			if(mr!=null) {
				System.out.println("실행");
				List<MultipartFile> files= mr.getFiles("resimg1");
				MultipartFile mf =  files.get(0);
				System.out.println("실행2");

				String orgFileName = mf.getOriginalFilename();
				System.out.println(orgFileName);
				if(orgFileName!=null &&!orgFileName.equals("")) {
					File f = new File(path,orgFileName);
					if(f.exists()) {
						for(int renameNum=0;;renameNum++) {
							//확장자와 파일을 분리한다.
							int point = orgFileName.lastIndexOf(".");
							String fileName = orgFileName.substring(0,point);
							//확장지
							String ext = orgFileName.substring(point+1);
							f = new File(path,fileName+"("+renameNum+")."+ext);
							if(!f.exists()) {//새로 생성된 파일객체가 없으면
								orgFileName = f.getName();
								break;
							}
						}
					}try {
						mf.transferTo(f);
					}catch(Exception e) {
						e.printStackTrace();
					}
					System.out.println(orgFileName);
					vo.setResimg(orgFileName);
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		service.restaurantInsert(vo);
		mav.setViewName("redirect:/myrestaurant");
		return mav;
	}
}