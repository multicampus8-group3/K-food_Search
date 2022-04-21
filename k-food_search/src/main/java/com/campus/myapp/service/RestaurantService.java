package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.ResPagingVO;
import com.campus.myapp.vo.RestaurantVO;
import com.campus.myapp.vo.memberVO;

public interface RestaurantService {
	// �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�뙃紐뚯삕�뜝占� �뜝�룞�삕�뜝�룞�삕
	public List<RestaurantVO> restaurantList(PagingVO vo);
		
	public int restaurantInsert(RestaurantVO vo);
	public List<RestaurantVO> restaurantMyList(String userid);
	public int restaurantDel (int resno);
	public RestaurantVO restaurantUpdateList(int resno);
	public int maxResno ();
	public String restarantImgDel(int resno);
	public int restaurantUpdateOk(RestaurantVO vo);
	
	//占쎌쟿占쎈뮞占쎈꽅占쎌삂 占쎄퐣燁살꼹�읂占쎌뵠筌욑옙
	public List<RestaurantVO> resList(ResPagingVO pVO);
	
	public RestaurantVO resSelect(int resno);
	//�럹�씠吏뺥뀒�뒪�듃
	public int totalRecord(ResPagingVO pVO);
	
	//fiorahoit
	public List<RestaurantVO> testreturn(RestaurantVO vo, String [] restypeArr);

}
