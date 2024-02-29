package com.tech.blog.entities;

public class Category {
	
	private int cid;
	private String cname;
	private String cdiscription;
	public Category(int cid, String cname, String cdiscription) {
		this.cid = cid;
		this.cname = cname;
		this.cdiscription = cdiscription;
	}
	public Category(String cname, String cdiscription) {
		this.cname = cname;
		this.cdiscription = cdiscription;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCdiscription() {
		return cdiscription;
	}
	public void setCdiscription(String cdiscription) {
		this.cdiscription = cdiscription;
	}
	
	

}
