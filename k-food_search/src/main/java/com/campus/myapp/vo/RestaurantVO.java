package com.campus.myapp.vo;

public class RestaurantVO {
	private Integer resno;
	private String resname;
	private String resadress;
	private double resgrade;
	private String rescontent;
	private String userid;
	private String writedate;
	private String resnation;
	private String resstate;
	private String restype;
	private String resimg;
	private String reshour;
	private String reshourend;
	private String website;
	
	private String searchKey;
	private String searchWord;
	
	/////////////////////////////////
	private String [] restypeArr;
	
	public String[] getRestypeArr() {
		return restypeArr;
	}
	public void setRestypeArr(String[] restypeArr) {
		this.restypeArr = restypeArr;
	}
	
	///////////////////////////
	
	
	public Integer getResno() {
		return resno;
	}
	public void setResno(Integer resno) {
		this.resno = resno;
	}
	public String getResname() {
		return resname;
	}
	public void setResname(String resname) {
		this.resname = resname;
	}
	public String getResadress() {
		return resadress;
	}
	public void setResadress(String resadress) {
		this.resadress = resadress;
	}
	public double getResgrade() {
		return resgrade;
	}
	public void setResgrade(double resgrade) {
		this.resgrade = resgrade;
	}
	public String getRescontent() {
		return rescontent;
	}
	public void setRescontent(String rescontent) {
		this.rescontent = rescontent;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
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
	public String getRestype() {
		return restype;
	}
	public void setRestype(String restype) {
		this.restype = restype;
	}
	public String getResimg() {
		return resimg;
	}
	public void setResimg(String resimg) {
		this.resimg = resimg;
	}
	public String getReshour() {
		return reshour;
	}
	public void setReshour(String reshour) {
		this.reshour = reshour;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public String getSearchKey() {
		return searchKey;
	}
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public String getReshourend() {
		return reshourend;
	}
	public void setReshourend(String reshourend) {
		this.reshourend = reshourend;
	}
	//test
	@Override
	public String toString() {
		return "RestaurantVO [resname=" + resname + ", resnation=" + resnation + ", resstate=" + resstate + "]";
	}
	
}
