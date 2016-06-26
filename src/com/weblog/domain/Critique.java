package com.weblog.domain;

public class Critique {
	private long id;
	private long AId;
	private String content;
	private String username;

	public long getId() {
		return id;
	}

	public long getAId() {
		return AId;
	}

	public void setId(long id) {
		this.id = id;
	}

	public void setAId(long id) {
		AId = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

}
