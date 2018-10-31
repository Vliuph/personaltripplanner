package com.mie.dao;

public class WrongUsernamePasswordException extends Exception {
	public String username;
	
	public WrongUsernamePasswordException(String username) {
		this.username = username;
	}
	
}
