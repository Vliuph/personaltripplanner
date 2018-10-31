package com.mie.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mie.model.*;
import com.mie.util.DbUtil;

public class ReviewDao {

	public static int publishReview(Review review) {
		Connection currentCon = null;
		ResultSet rs = null;
		Statement stmt = null;
		String searchQuery = "select review_id, submitted_datetime from reviews where user_id_name='" + (new Integer(review.getUserID())).toString()
				+ "' and attraction_id_name='" + (new Integer(review.getAttractionID())).toString() + "'";
		String createQuery = "insert into reviews (user_id_name, attraction_id_name, review_text, rating, submitted_datetime) values (?, ?, ?, ?, ?)";
		try {
			currentCon = DbUtil.getConnection();
			PreparedStatement preparedStatement = currentCon.prepareStatement(createQuery);
			preparedStatement.setInt(1, review.getUserID());
			preparedStatement.setInt(2, review.getAttractionID());
			preparedStatement.setString(3, review.getText());
			preparedStatement.setInt(4, review.getRating());
			preparedStatement.setDate(5, new java.sql.Date(review.getSubmittedDatetime().getTime()));
			preparedStatement.executeUpdate();
			stmt = currentCon.createStatement();
			rs = stmt.executeQuery(searchQuery);
			int id = 0;
			int candidate_id;
			while (rs.next()) {
				candidate_id = rs.getInt("review_id");
				if (candidate_id > id) {
					id = candidate_id;
				}
			}
			return id;
		} catch (SQLException ex) {
			ex.printStackTrace();
			System.out.println("publishReview failed: An Exception has occurred! " + ex);
			return 0;
		}
	}
	
	public static Map<String, Object> getByID(int id) {
		Connection currentCon = null;
		ResultSet rs = null;
		Statement stmt = null;
		Map<String, Object> values; 
		String searchQuery = "select * from reviews where review_id='" + (new Integer(id)).toString() + "'";
		try {
			currentCon = DbUtil.getConnection();
			stmt = currentCon.createStatement();
			rs = stmt.executeQuery(searchQuery);
			boolean more = rs.next();
			if (more) {
				values = new HashMap<String, Object>();
				values.put("userID", rs.getInt("user_id_name"));
				values.put("attractionID", rs.getInt("attraction_id_name"));
				values.put("submittedDatetime", rs.getDate("submitted_datetime"));
				values.put("text", rs.getString("review_text"));
				values.put("rating", rs.getInt("rating"));
				return values;
			} else {
				return null;
			}
		} catch (Exception ex) {
			System.out.println("getByID failed: An Exception has occurred! " + ex);
			return null;
		}
	}
	
	public static List<Integer> getUserReviewIDs(int user_id) {
		Connection currentCon = null;
		ResultSet rs = null;
		Statement stmt = null;
		List<Integer> ids = new ArrayList<Integer>();
		String searchQuery = "select review_id from reviews where user_id_name='" + (new Integer(user_id)).toString() + "'";
		try {
			currentCon = DbUtil.getConnection();
			stmt = currentCon.createStatement();
			rs = stmt.executeQuery(searchQuery);
			while (rs.next()) {
				ids.add(rs.getInt("review_id"));
			}
			return ids;
		}
		catch (Exception ex) {
			System.out.println("getUserReviewIDs failed: An Exception has occurred! " + ex);
			return null;
		}
	}
	
	public static List<Integer> getAttractionReviewIDs(int attraction_id) {
		Connection currentCon = null;
		ResultSet rs = null;
		Statement stmt = null;
		List<Integer> ids = new ArrayList<Integer>();
		String searchQuery = "select review_id from reviews where attraction_id_name='" + (new Integer(attraction_id)).toString() + "'";
		try {
			currentCon = DbUtil.getConnection();
			stmt = currentCon.createStatement();
			rs = stmt.executeQuery(searchQuery);
			while (rs.next()) {
				ids.add(rs.getInt("review_id"));
			}
			return ids;
		}
		catch (Exception ex) {
			System.out.println("getAttractionReviewIDs failed: An Exception has occurred! " + ex);
			return null;
		}
	}
}
