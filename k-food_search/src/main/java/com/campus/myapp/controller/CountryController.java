
package com.campus.myapp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.campus.myapp.service.RestaurantService;	
import com.campus.myapp.service.countryService;
import com.campus.myapp.vo.RestaurantVO;
import com.campus.myapp.vo.countryVO;

@Controller
//@RestController   
public class CountryController {
	@Inject
	countryService service;
	@Inject
	RestaurantService res_service;
	
	@GetMapping("/country/stateList")
	@ResponseBody
	public Map<String,Object> stateList2(String nation){
		List<countryVO> stList=service.stateList(nation);
		List<RestaurantVO> restList=service.restListByNation(nation);
		Map<String,Object>map=new HashMap<String,Object>();
		map.put("stateList", stList);
		map.put("restList", restList);
		return map;
	}
	@GetMapping("/stateList")
	@ResponseBody
	public List<countryVO> stateList1(String nation){
		return service.stateList(nation);
	}
	
	@GetMapping("/country/restList")
	@ResponseBody
	public Map<String,Object>  restList(String nation, String state){
		List<countryVO> stList=service.stateList(nation);
		List<RestaurantVO> restList=service.restList(nation, state);
		Map<String,Object>map=new HashMap<String,Object>();
		map.put("stateList", stList);
		map.put("restList", restList);
		return map;
	}
	@GetMapping("/country/restype2")
	@ResponseBody
	public List<RestaurantVO> babo (RestaurantVO vo) {
		List<RestaurantVO> lst = res_service.testreturn(vo, vo.getRestypeArr());
		return lst;
	}
}