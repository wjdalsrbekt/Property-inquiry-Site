package com.ssafy.happyhouse.model;

public class HouseInfoDto {
	private int no;
	private String dong;
	private String aptname;
	private String buildyear;
	private String jibun;
	private String lat;
	private String lng;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getAptname() {
		return aptname;
	}

	public void setAptname(String aptname) {
		this.aptname = aptname;
	}

	public String getBuildyear() {
		return buildyear;
	}

	public void setBuildyear(String buildyear) {
		this.buildyear = buildyear;
	}

	public String getJibun() {
		return jibun;
	}

	public void setJibun(String jibun) {
		this.jibun = jibun;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	@Override
	public String toString() {
		return "HouseInfoDto [no=" + no + ", dong=" + dong + ", aptname=" + aptname + ", buildyear=" + buildyear
				+ ", jibun=" + jibun + ", lat=" + lat + ", lng=" + lng + "]";
	}

}
