package com.tech.blog.entities;

import java.sql.Timestamp;

public class Posts {
	private int pid;
	private String pTitle;
	private String pContext;
	private String pCode;
	private String pPic;
	private Timestamp pDate;
	private int cid;
	private int userId;
	public Posts(int pid, String pTitle, String pContext, String pCode, String pPic, Timestamp pDate, int cid,int userId) {
		this.pid = pid;
		this.pTitle = pTitle;
		this.pContext = pContext;
		this.pCode = pCode;
		this.pPic = pPic;
		this.pDate = pDate;
		this.cid = cid;
		this.userId=userId;
	}
	public Posts(String pTitle, String pContext, String pCode, String pPic, Timestamp pDate, int cid,int userId) {
		this.pTitle = pTitle;
		this.pContext = pContext;
		this.pCode = pCode;
		this.pPic = pPic;
		this.pDate = pDate;
		this.cid = cid;
		this.userId=userId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getpTitle() {
		return pTitle;
	}
	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}
	public String getpContext() {
		return pContext;
	}
	public void setpContext(String pContext) {
		this.pContext = pContext;
	}
	public String getpCode() {
		return pCode;
	}
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}
	public String getpPic() {
		return pPic;
	}
	public void setpPic(String pPic) {
		this.pPic = pPic;
	}
	public Timestamp getpDate() {
		return pDate;
	}
	public void setpDate(Timestamp pDate) {
		this.pDate = pDate;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	
	

}
