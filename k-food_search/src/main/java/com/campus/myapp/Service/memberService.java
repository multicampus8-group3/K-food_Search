package com.campus.myapp.Service;

import com.campus.myapp.vo.memberVO;

public interface memberService {
	public int memberInsert(memberVO vo);
	public int memberIdOk(String id);
	public memberVO loginOk(memberVO vo);
}
