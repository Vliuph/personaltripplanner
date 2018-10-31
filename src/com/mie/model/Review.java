package com.mie.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.mie.dao.AttractionDao;
import com.mie.dao.ReviewDao;

public class Review {
	int id;
	User user;
	int userID;
	Attraction attraction;
	int attractionID;
	String text;
	int rating;
	Date submittedDatetime;
	
	public Review(User user, Attraction attraction, String text, int rating) {
		submittedDatetime = new java.util.Date();
		this.user = user;
		this.userID = user.getID();
		this.attraction = attraction;
		this.attractionID = attraction.getID();
		this.text = text;
		this.rating = rating;
		id = publish();
	}
	
	private Review(int id, int userID, int attractionID, String text, int rating, Date submittedDatetime) {
		this.id = id;
		this.userID = userID;
		this.attractionID = attractionID;
		this.text = text;
		this.rating = rating;
		this.submittedDatetime = submittedDatetime;
	}
	
	public static Review getByID(int id) {
		Map<String, Object> values = ReviewDao.getByID(id);
		if (values != null) {
			Review review = new Review(id, (Integer) values.get("userID"), (Integer) values.get("attractionID"),
					(String) values.get("text"), (Integer) values.get("rating"), (Date) values.get("submittedDatetime"));
			return review;
		} else {
			return null;
		}
	}
	
	public static List<Review> getUserReviews(int user_id) {
		List<Integer> ids = ReviewDao.getUserReviewIDs(user_id);
		List<Review> reviews = new ArrayList<Review>();
		Review review;
		for (int id: ids) {
			review = getByID(id);
			reviews.add(review);
		}
		return reviews;
	}
	
	public static List<Review> getAttractionReviews(int attraction_id) {
		List<Integer> ids = ReviewDao.getAttractionReviewIDs(attraction_id);
		List<Review> reviews = new ArrayList<Review>();
		Review review;
		for (int id: ids) {
			review = getByID(id);
			reviews.add(review);
		}
		return reviews;
	}
	
	void linkUser(User user) {
		assert user.getID() == userID;
		this.user = user;
	}
	
	void linkAttraction(Attraction attraction) {
		assert attraction.getID() == attractionID;
		this.attraction = attraction;
	}
	
	int publish() {
		if (id == 0) {
			return ReviewDao.publishReview(this);
		} else {
			return id;
		}
	}
	
	public int getUserID() {
		return userID;
	}
	
	public String getUsername() {
		return user.getUsername();
	}
	
	public int getAttractionID() {
		return attractionID;
	}
	
	public String getText() {
		return text;
	}
	
	public int getRating() {
		return rating;
	}
	
	public Date getSubmittedDatetime() {
		return submittedDatetime;
	}
}
