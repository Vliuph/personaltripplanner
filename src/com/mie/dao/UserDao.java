package com.mie.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.mie.model.*;
import com.mie.util.DbUtil;

public class UserDao {
	
	public static Map<String, Object> login(String username, String password) {
		Connection currentCon = null;
		ResultSet rs = null;
		Statement stmt = null;
		Map<String, Object> values; 
		/**
		 * Prepare a query that searches the users table in the database
		 * with the given username and password.
		 */
		String searchQuery = "select * from users where username='"
				+ username + "' AND password='" + password + "'";
		try {
			// connect to DB
			currentCon = DbUtil.getConnection();
			stmt = currentCon.createStatement();
			rs = stmt.executeQuery(searchQuery);
			boolean more = rs.next();

			if (more) {
				values = new HashMap<String, Object>();
				values.put("id", rs.getInt("user_id"));
				return values;
			} else {
				return null;
			}
		}

		catch (Exception ex) {
			System.out.println("Log In failed: An Exception has occurred! " + ex);
			return null;
		}
	}
	
	public static int registerNewUser(String username, String password) throws DuplicateUserException {
		Connection currentCon = null;
		ResultSet rs = null;
		Statement stmt = null;
		String searchQuery = "select user_id from users where username='" + username + "'";
		String createQuery = "insert into users (username, password, registered_datetime) values (?, ?, ?)";
		try {
			currentCon = DbUtil.getConnection();
			stmt = currentCon.createStatement();
			rs = stmt.executeQuery(searchQuery);
			boolean more = rs.next();
			if (more) {
				throw new DuplicateUserException(username);
			} else {
				try {
					Date date = new Date();
					PreparedStatement preparedStatement = currentCon.prepareStatement(createQuery);
					preparedStatement.setString(1, username);
					preparedStatement.setString(2, password);
					preparedStatement.setDate(3, new java.sql.Date(date.getTime()));
					preparedStatement.executeUpdate();
					stmt = currentCon.createStatement();
					rs = stmt.executeQuery(searchQuery);
					more = rs.next();
					if (more) {
						int id = rs.getInt("user_id");
						return id;
					} else {
						return 0;
					}
				} catch (SQLException ex) {
					System.out.println("Log In failed: An Exception has occurred! " + ex);
					return 0;
				}
			}
		} catch (Exception ex) {
			System.out.println("Log In failed: An Exception has occurred! " + ex);
			return 0;
		}
	}
	
	public static Map<String, Object> getByID(int id) {
		Connection currentCon = null;
		ResultSet rs = null;
		Statement stmt = null;
		Map<String, Object> values; 
		String searchQuery = "select * from users where user_id='" + (new Integer(id)).toString() + "'";
		try {
			currentCon = DbUtil.getConnection();
			stmt = currentCon.createStatement();
			rs = stmt.executeQuery(searchQuery);
			boolean more = rs.next();
			if (more) {
				values = new HashMap<String, Object>();
				values.put("username", rs.getString("username"));
				return values;
			} else {
				return null;
			}
		} catch (Exception ex) {
			System.out.println("getByID failed: An Exception has occurred! " + ex);
			return null;
		}
	}
	
	public static Map<String, Object> getByUsername(String username) {
		Connection currentCon = null;
		ResultSet rs = null;
		Statement stmt = null;
		Map<String, Object> values; 
		String searchQuery = "select * from users where username='" + username + "'";
		try {
			currentCon = DbUtil.getConnection();
			stmt = currentCon.createStatement();
			rs = stmt.executeQuery(searchQuery);
			boolean more = rs.next();
			if (more) {
				values = new HashMap<String, Object>();
				values.put("user_id", rs.getInt("user_id"));
				return values;
			} else {
				return null;
			}
		} catch (Exception ex) {
			System.out.println("getByID failed: An Exception has occurred! " + ex);
			return null;
		}
	}
}
