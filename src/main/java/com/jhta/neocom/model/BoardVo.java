package com.jhta.neocom.model;

import java.sql.Date;

public class BoardVo {
/*
	bno int not null,
	title varchar(30) not null,
	content varchar(3000) not null,
	writer varchar(30) not null,
	regDate DATETIME DEFAULT CURRENT_TIMESTAMP,
	viewCnt int default 0,
*/

	private String title;
	private String content;
	private String writer;
	private Date regDate;
	private int viewCnt;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
}

