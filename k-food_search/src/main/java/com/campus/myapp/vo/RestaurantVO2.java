package com.campus.myapp.vo;

public class RestaurantVO2 {
	private String userid;
	private String resnation;
	private String resstate;
	
	
	public RestaurantVO2() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RestaurantVO2(String userid, String resnation, String resstate) {
		super();
		this.userid = userid;
		this.resnation = resnation;
		this.resstate = resstate;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getResnation() {
		return resnation;
	}
	public void setResnation(String resnation) {
		this.resnation = resnation;
	}
	public String getResstate() {
		return resstate;
	}
	public void setResstate(String resstate) {
		this.resstate = resstate;
	}
	

}
