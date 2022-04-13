package com.campus.myapp.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.campus.myapp.service.AdService;
import com.campus.myapp.vo.AdVO;

@RestController
public class AdController {
	@Inject
	AdService service;
	
	// 관리자페이지에서 광고신청목록 보기
	@GetMapping("/ad/adListToAdmin")
	@ResponseBody
	public List<AdVO> list(AdVO vo) {
		return service.adList(vo);
	}
	
	@PostMapping("/adStatusChangeOk")
	@ResponseBody
	public int adStatusChangeOk(AdVO vo) {
		return service.adStatusChange(vo);
	}
}
