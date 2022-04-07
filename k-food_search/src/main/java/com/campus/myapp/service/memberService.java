package com.campus.myapp.service;

import com.campus.myapp.vo.memberVO;

public interface memberService {
	public int memberInsert(memberVO vo);
	public int memberIdOk(String id);
	public memberVO loginOk(memberVO vo);
	public memberVO memberSelect(String userid);
}
