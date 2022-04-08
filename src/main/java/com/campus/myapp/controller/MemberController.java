package com.campus.myapp.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.campus.myapp.service.MemberService;
import com.campus.myapp.vo.MemberVO;

@RestController
@RequestMapping("/member/*")
public class MemberController {
	@Inject
	MemberService service;
	
	// 관리자페이지에서 회원목록 보기
	@GetMapping("listtoadmin")
	public List<MemberVO> list(MemberVO vo) {
		return service.memberList(vo);
	}
}
