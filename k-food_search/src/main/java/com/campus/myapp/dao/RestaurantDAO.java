package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.ResPagingVO;
import com.campus.myapp.vo.RestaurantVO;
import com.campus.myapp.vo.memberVO;

@Mapper
@Repository
public interface RestaurantDAO {
	// 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쌉몌옙占� 占쏙옙占쏙옙
	public List<RestaurantVO> restaurantList(PagingVO vo);
		
	public int restaurantInsert(RestaurantVO vo);
	public List<RestaurantVO> restaurantMyList(String userid);
	public int restaurantDel (int resno);
	public RestaurantVO restaurantUpdateList(int resno);
	public int maxResno ();
	public String restarantImgDel(int resno);
	public int restaurantUpdateOk(RestaurantVO vo);
	
	//�젅�뒪�넗�옉 �꽌移섑럹�씠吏�
	public List<RestaurantVO> resList(ResPagingVO pVO);
	public RestaurantVO resSelect(int resno);
	//페이징테스트
	public int totalRecord(ResPagingVO pVO);
	
	//백동현22-04-21
	public List<RestaurantVO> testreturn(RestaurantVO vo, String [] restypeArr);
}
