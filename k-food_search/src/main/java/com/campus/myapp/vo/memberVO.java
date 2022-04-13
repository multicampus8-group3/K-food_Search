package com.campus.myapp.vo;

public class memberVO {
	private String userid;
	private String userpwd;
	private String username;
	private String usernation;
	private String favornation;
	private String favorstate;
	private String tel;
	private String usertype;
	private String wrtedate;
	
	private String [] telArray;
	private String tel1;
	private String tel2;
	

	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUsernation() {
		return usernation;
	}
	public void setUsernation(String usernation) {
		this.usernation = usernation;
	}
	public String getFavornation() {
		return favornation;
	}
	public void setFavornation(String favornation) {
		this.favornation = favornation;
	}
	public String getFavorstate() {
		return favorstate;
	}
	public void setFavorstate(String favorstate) {
		this.favorstate = favorstate;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		tel1 = tel.substring(0, 3);
		tel2 = tel.substring(3);
		this.tel = tel;
	}
	public String getUsertype() {
		return usertype;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	public String getWrtedate() {
		return wrtedate;
	}
	public void setWrtedate(String wrtedate) {
		this.wrtedate = wrtedate;
	}
	public String[] getTelArray() {
		return telArray;
	}
	public void setTelArray(String[] telArray) {
		setTel(telArray[0]+telArray[1]);
		this.telArray = telArray;
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	
}
