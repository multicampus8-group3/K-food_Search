package com.campus.myapp.vo;

public class memReservVO {
	//마이페이지-멤버예약관련VO-작성자: 최원준
	private int no;
	private String userid;
	private int resno;
	private String writedate;
	private String reservdate;
	private String reservtime;
	private int reservp;
	private String status;
	//식당정보
	private String resname;
	private String website;
	//예약 회원 정보
	private String username;
	private String tel;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getResno() {
		return resno;
	}
	public void setResno(int resno) {
		this.resno = resno;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public String getReservdate() {
		return reservdate;
	}
	public void setReservdate(String reservdate) {
		this.reservdate = reservdate;
	}
	public String getReservtime() {
		return reservtime;
	}
	public void setReservtime(String reservtime) {
		this.reservtime = reservtime;
	}
	public int getReservp() {
		return reservp;
	}
	public void setReservp(int reservp) {
		this.reservp = reservp;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getResname() {
		return resname;
	}
	public void setResname(String resname) {
		this.resname = resname;
	}
	
	//식당정보
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
}
