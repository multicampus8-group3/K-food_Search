package com.campus.myapp.controller;

import java.io.File;
import java.nio.charset.Charset;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.dao.adminPageNationDAO;
import com.campus.myapp.service.AdService;
import com.campus.myapp.vo.AdVO;
import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.RestaurantVO;

@RestController
public class AdController {
	@Inject
	AdService service;
	@Inject
	adminPageNationDAO apnService;
	// 관리자페이지에서 광고신청목록 보기
	@GetMapping("/ad/adListToAdmin")
	@ResponseBody
	public List<AdVO> list(PagingVO vo) {
		return service.adList(vo);
	}
	@GetMapping("/ad/adPageNation")
	@ResponseBody
	public PagingVO restaurantPageNation(PagingVO vo) {
	   vo.setTotalRecord(apnService.adTotalRecord(vo));
	   return vo;
	}
	@PostMapping("/adStatusChangeOk")
	@ResponseBody
	public int adStatusChangeOk(AdVO vo) {
		return service.adStatusChange(vo);
	}
	@GetMapping("/myrestaurant/restaurantAdApplication")
	public ModelAndView restaurantAdApplication() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/myrestaurant/restaurantAdApplication");
		return mav;
	}
	@GetMapping("/myrestaurant/restaurantAdApplicationWrite")
	public ModelAndView restaurantAdApplicationWrite(HttpSession session) {
		String userid = (String)session.getAttribute("logId");
		ModelAndView mav = new ModelAndView();
		List<RestaurantVO> lst = service.resnoList(userid);
		System.out.println(lst.get(0).getResno());
		mav.addObject("lst",lst);
		mav.setViewName("/myrestaurant/restaurantAdApplicationWrite");
		return mav;
	}
	@PostMapping("/myrestaurant/restaurantAdApplicationWriteOk")
	public ResponseEntity<String> restaurantAdApplicationWriteOk(AdVO vo, HttpServletRequest request){
		ResponseEntity<String> entity = null;
		HttpHeaders hearders = new HttpHeaders();
		hearders.setContentType(new MediaType("text","html",Charset.forName("utf-8")));
		String msg = null;
		vo.setUserid((String)request.getSession().getAttribute("logId"));
		String path = request.getSession().getServletContext().getRealPath("adImg");
		//파일 Delete 메소드 호출을 위한 객체 생성
		RestaurantController rc = new RestaurantController();
		//배너 이미지 파일 저장 - vo에 배너 이미지 이름 저장
		try {
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest) request;
			if(mr!=null) {
				List<MultipartFile> files= mr.getFiles("bennerimg1");
				MultipartFile mf =  files.get(0);
				String orgFileName = mf.getOriginalFilename();
				System.out.println("파일이름=" + orgFileName);
				if(orgFileName!= null &&!orgFileName.equals("")) {
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
					vo.setBannerimg(orgFileName);
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
			rc.fileDelete(path, vo.getBannerimg());
		}//파일 저장 및 vo 배너 이미지 set 완료
		//인서트 작성 부분
		System.out.println(vo.getBannerimg());
		//엔티티 전송부분
		try {
			msg = "<script>alert('광고 신청이 완료되었습니다.');location.href='/myrestaurant/myrestaurant'</script>";
			service.restaurantAdInsert(vo);
			//글목록으로 이동
			entity = new ResponseEntity<String>(msg,hearders,HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			rc.fileDelete(path, vo.getBannerimg());
			msg = "<script>alert('광고 신청이 실패하였습니다. \\n매장등록번호가 맞지 않거나 배너 파일 이름이 너무 깁니다.');history.back()</script>";
			//글 등록폼으로
			entity = new ResponseEntity<String>(msg,hearders,HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@GetMapping("/restaurantAdListView")
	public List<AdVO> restaurantAdListView(HttpSession session) {
		return service.restaurantAdListView((String)session.getAttribute("logId"));
	}
}
