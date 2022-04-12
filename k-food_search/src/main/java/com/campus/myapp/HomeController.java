package com.campus.myapp;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.AdService;
import com.campus.myapp.service.BestMenuService;

@Controller
public class HomeController {
	@Inject
	AdService adservice;
	@Inject
	BestMenuService bmservice;
	
	@RequestMapping("/")
	public String home() {
		
		//���� ������ ���� �޴� 10�� �����ͼ� �����ϰ� 4�� ����
		//Model에 저장 "bestMenu"
		ModelAndView mav=new ModelAndView();
		mav.addObject("bmgrade", bmservice.bmSelect());
		mav.addObject("adimg",adservice.adSelect());
		mav.setViewName("home");
		
		//���� ���̺����� ������ �������� �����ͼ� 
		//�𵨿� ���� "Ad_rest"
		
		
		/*
		 * //DB���� ������ ��� ������ �������� �ѱ�� m.addAttribute("contents",
		 * mainService.getAllContent(cvo)); //���� ���� ��ü �������� m.addAttribute("ad",
		 * mainService.getAllAd().get(0)); List<ManagerAdVO> ad =mainService.getAllAd();
		 * if(ad.size() > 0) m.addAttribute("ad", ad.get(0));
		 */
		return "home";
	}
}