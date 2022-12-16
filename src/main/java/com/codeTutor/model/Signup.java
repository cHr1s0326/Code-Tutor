package com.codeTutor.model;

public class Signup {
	private String password;
	private String passwordRepeat;

	public String getPasswordRepeat() {
		return passwordRepeat;
	}

	public void setPasswordRepeat(String passwordRepeat) {
		this.passwordRepeat = passwordRepeat;
	}

	@Override
	public String toString() {
		return "UserLogin [password=" + password + ", passwordRepeat=" + passwordRepeat + "]";
	}
}
