package com.campus.myapp.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.FaqService;
import com.campus.myapp.service.RestaurantService;
import com.campus.myapp.service.countryService;
import com.campus.myapp.service.memFavorService;
import com.campus.myapp.vo.FaqAnswerVO;
import com.campus.myapp.vo.FaqVO;
import com.campus.myapp.vo.ResPagingVO;
import com.campus.myapp.vo.RestaurantVO;
import com.campus.myapp.vo.countryVO;
import com.campus.myapp.vo.memFavorVO;

@RestController
public class RestaurantController {
	@Inject
	RestaurantService service;
	@Inject
	FaqService fservice;
	@Inject
	countryService countryService;
	@Inject
	memFavorService memFavorService;
	@Inject
	FaqService faqService;
	
	// 관리자페이지에서 가게목록 보기
	@GetMapping("/restaurant/resListToAdmin")
	@ResponseBody
	public List<RestaurantVO> list(RestaurantVO vo) {
		return service.restaurantList(vo);
	}
	// 관리자페이지에서 가게검색
	@GetMapping("/restaurant/resSearchToAdmin")
	@ResponseBody
	public List<RestaurantVO> getSearchList(@RequestParam("searchKey") String searchKey, 
				@RequestParam("searchWord") String searchWord, RestaurantVO vo) {
		vo.setSearchKey(searchKey);
		vo.setSearchWord(searchWord);
		return service.getSearchList(vo);
	}	
		
	@GetMapping("/myrestaurant/myrestaurant")
	public ModelAndView myrestaurant() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/myrestaurant/restaurantMain");
		return mav;
	}
	@GetMapping("/myrestaurant/restaurantSignUp")
	public ModelAndView restaurantSignUp() {
		ModelAndView mav = new ModelAndView();
		List<FaqVO> lst = fservice.faqList(null);
		List<countryVO> countrylist = countryService.countryList();
		mav.addObject("countrylist", countrylist);
		mav.addObject("faqList",lst);
		mav.setViewName("/myrestaurant/restaurantSignUp");
		return mav;
	}
	@GetMapping("/myrestaurant/restaurantUpdateList")
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
	public int restaurantDel(int resno, HttpServletRequest request) {
		String resimg = service.restarantImgDel(resno);
		String path = request.getSession().getServletContext().getRealPath("resImg");
		fileDelete(path, resimg);
		return service.restaurantDel(resno);
	}
	@GetMapping("/myrestaurant/restaurantUpdateWrite")
	public ModelAndView restaurantUpdateWrite(int resno) {
		ModelAndView mav = new ModelAndView ();
		List<FaqVO> lst = fservice.faqList(null);
		List<FaqAnswerVO> alst = fservice.faqAnswerUpdateList(resno);
		List<countryVO> countrylist = countryService.countryList();
		mav.addObject("countrylist", countrylist);
		mav.addObject("faqAnsList",alst);
		mav.addObject("faqList",lst);
		mav.addObject("vo",service.restaurantUpdateList(resno));
		mav.setViewName("/myrestaurant/restaurantUpdateWrite");
		return mav;
	}
	@PostMapping("/myrestaurant/restaurantUpdateOk")
	public ModelAndView restaurantUpdateOk(RestaurantVO vo, FaqAnswerVO Fvo, HttpServletRequest request, String resimgOrg) {
		ModelAndView mav = new ModelAndView();
		vo.setUserid((String)request.getSession().getAttribute("logId"));
		String path = request.getSession().getServletContext().getRealPath("resImg");
		System.out.println(resimgOrg);
		try {
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest) request;
			if(mr!=null) {
				
				List<MultipartFile> files= mr.getFiles("resimg1");
				MultipartFile mf =  files.get(0);

				String orgFileName = mf.getOriginalFilename();
				System.out.println("파일이름=" + orgFileName);
				if(orgFileName!=null &&!orgFileName.equals("")) {
					if(!resimgOrg.equals("noimg.gif")) {
						fileDelete(path, resimgOrg);
						System.out.println("삭제 실행");
					}
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
					vo.setResimg(orgFileName);
				}else {
					vo.setResimg(resimgOrg);
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
			fileDelete(path,vo.getResimg());
		}
		//레스토랑 업데이트 작성.
		//System.out.println(vo.getRescontent());
		//System.out.println(vo.getUserid());
		service.restaurantUpdateOk(vo);
		fservice.faqAnswerDel(vo.getResno());
		int max = vo.getResno();
		if(Fvo.getFaqno()!=null) {
			//System.out.println("실행");
			Fvo.setMax(max);
			for(int i=0; i<Fvo.getFaqno().length; i++) {
				fservice.faqAnswerInsert(max,Fvo.getFaqno()[i],Fvo.getContent()[i]);
			}
		}
		mav.setViewName("redirect:/restaurantInfo?resno="+vo.getResno());
		return mav;
	}
	@PostMapping("/myrestaurant/resSignUp")
	public ModelAndView resSignUp (RestaurantVO vo, FaqAnswerVO Fvo, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView ();
		vo.setUserid((String)request.getSession().getAttribute("logId"));
		String path = request.getSession().getServletContext().getRealPath("resImg");
		System.out.println(path);
		try {
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest) request;
			if(mr!=null) {
				List<MultipartFile> files= mr.getFiles("resimg1");
				MultipartFile mf =  files.get(0);

				String orgFileName = mf.getOriginalFilename();
				System.out.println("파일이름=" + orgFileName);
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
					vo.setResimg(orgFileName);
				}else {
					vo.setResimg("noimg.gif");
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
			fileDelete(path,vo.getResimg());
		}
		service.restaurantInsert(vo);
		int max = service.maxResno();
		if(Fvo.getFaqno()!=null) {
			Fvo.setMax(max);
			for(int i=0; i<Fvo.getFaqno().length; i++) {
				fservice.faqAnswerInsert(max,Fvo.getFaqno()[i],Fvo.getContent()[i]);
			}
		}
		mav.setViewName("redirect:/myrestaurant/myrestaurant");
		return mav;
	}
	@GetMapping("/myrestaurant/restaurantReserveCheck")
	public ModelAndView restaurantReserveCheck() {
		ModelAndView mav = new ModelAndView ();
		mav.setViewName("/myrestaurant/restaurantReserveCheck");
		return mav;
	}
	
	//파일지우기
	public void fileDelete(String path, String fileName) {
		if(fileName!=null) {
			File file = new File(path,fileName);
			file.delete();
		}
	}

	//식당서치 페이지변경 부분
	@GetMapping("/restaurant/resList")
	public List<RestaurantVO> resList(RestaurantVO vo, ResPagingVO pVO) {
		pVO.setTotalRecord(service.totalRecord(pVO));
		//service.resList(vo);
		System.out.println(pVO.getPageNum());
		System.out.println("전체레코드"+pVO.getTotalRecord());
		System.out.println("한페이지"+pVO.getOnePageRecord());
		System.out.println("인덱스"+pVO.getOffsetIndex());
		return service.resList(pVO);
	}
	//식당정보 페이지
	@GetMapping("restaurantInfo")
	public ModelAndView restaurantInfo(int resno, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", service.resSelect(resno));
		String userid = (String)session.getAttribute("logId");
		String result = memFavorService.memFavorSelect(userid, resno);
		if(result == null) {
			result = "0";
		}
		mav.addObject("memfavor", result);
		//faq 정보가져오기
		mav.addObject("faq", faqService.faqSelect(resno));
		mav.setViewName("/restaurant/restaurantInfo");
		return mav;		
	}
}