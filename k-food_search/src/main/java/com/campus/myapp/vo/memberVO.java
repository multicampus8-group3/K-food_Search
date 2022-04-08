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
	private String writedate;
	
	private String [] telArray;

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
		this.tel = tel;
	}
	public String getUsertype() {
		return usertype;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public String[] getTelArray() {
		return telArray;
	}
	public void setTelArray(String[] telArray) {
		setTel(telArray[0]+telArray[1]);
		this.telArray = telArray;
	}
}
