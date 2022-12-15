package com.codeTutor.model;

public class User {
	private int uid;
	private String nickname;
	private String password;
	private String passwordRepeat;

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordRepeat() {
		return passwordRepeat;
	}

	public void setPasswordRepeat(String passwordRepeat) {
		this.passwordRepeat = passwordRepeat;
	}

	@Override
	public String toString() {
		return "User [uid=" + uid + ", nickname=" + nickname + ", password=" + password + ", passwordRepeat="
				+ passwordRepeat + "]";
	}
}
