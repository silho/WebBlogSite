package com.weblog.domain;

import java.util.Date;

public class Dianjiliang {
	private long Id;
	private long AId;
	private String ip;
	private Date time;
	public long getId() {
		return Id;
	}
	public void setId(long id) {
		Id = id;
	}
	public long getAId() {
		return AId;
	}
	public void setAId(long id) {
		AId = id;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	
	
}
