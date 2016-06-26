package com.weblog.domain;

public class ArticleClass {
	private long id; 
	//用户id
	private long userid;
	//分类名称
	private String name;	
	public long getId() {
		return id;
	}
	
	public long getUserid() {
		return userid;
	}

	public void setUserid(long userid) {
		this.userid = userid;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	

}
