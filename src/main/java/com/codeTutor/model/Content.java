package com.codeTutor.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Content {
	private int fid;
	private String name;
	private String description;
	private String content;
	private String author;
	private String language;
	private String date;
	
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getDate() {
		return date;
	}
	
	public void setDate() {
		Date time = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		
		this.date = sdf.format(time);
	}
	
	public void setDate(String date) {
		this.date = date;
	}
	
	@Override
	public String toString() {
		return "Content [fid=" + fid + ", name=" + name + ", description=" + description + ", content=" + content
				+ ", author=" + author + ", language=" + language + ", date=" + date + "]";
	}
}
