package com.mie.dao;

public class DuplicateUserException extends Exception {
	
	String username;
	
	public DuplicateUserException(String username) {
		this.username = username;
	}
}
