package com.mie.model;

import java.util.List;
import java.util.Map;

import com.mie.dao.AttractionDao;
import com.mie.dao.DuplicateUserException;
import com.mie.dao.PasswordMismatchException;
import com.mie.dao.UserDao;
import com.mie.dao.WrongUsernamePasswordException;

public class User {
	
	int id = 0;
	String username;
	
	public User(String username, String password) throws WrongUsernamePasswordException {
		this.username = username;
		Map<String, Object> values = UserDao.login(username, password);
		// TODO populate values
		if (values != null) {
			id = (Integer) values.get("id");
		} else {
			throw new WrongUsernamePasswordException(username);
		}
	}
	
	public User(String username, String password, String passwordConfirm) throws DuplicateUserException, PasswordMismatchException {
		if (password.equals(passwordConfirm) && password != null) {
			this.username = username;
			id = UserDao.registerNewUser(username, password);
		} else {
			throw new PasswordMismatchException();
		}
	}
	
	private User(int id, String username) {
		this.id = id;
		this.username = username;
	}
	
	public boolean isValid() {
		return id != 0;
	}
	
	public static User getByID(int id) {
		Map<String, Object> values = UserDao.getByID(id);
		if (values != null) {
			User user = new User(id, (String) values.get("username"));
			return user;
		} else {
			return null;
		}
	}
	
	public static User getByUsername(String username) {
		Map<String, Object> values = UserDao.getByUsername(username);
		if (values != null) {
			User user = new User((Integer) values.get("user_id"), username);
			return user;
		} else {
			return null;
		}
	}
	
	public int getID() {
		return id;
	}
	
	public String getUsername() {
		return username;
	}
}
