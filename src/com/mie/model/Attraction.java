package com.mie.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.mie.dao.AttractionDao;
import com.mie.dao.CityDao;

public class Attraction {

	int id;
	String name;
	int cityID;
	City city;
	int cost;
	int openHour;
	int closeHour;
	int hours;
	String description = "Pellentesque habitant morbi tristique senectus et netus et malesuada "
			+ "fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, "
			+ "tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies "
			+ "mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper "
			+ "pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. "
			+ "Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus "
			+ "lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, "
			+ "neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. "
			+ "Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus";
	String mapPath;
	List<String> imagePaths;
	List<Review> reviews;
	
	private Attraction(int id, String name, int cityID, int cost, int openHour, int closeHour, int hours, String description, String mapPath) {
		this.id = id;
		this.name = name;
		this.cityID = cityID;
		this.city = null;
		this.cost = cost;
		this.openHour = openHour;
		this.closeHour = closeHour;
		this.hours = hours;
		if (description != null && description.length() > 0) {
			this.description = description;
		}
		this.mapPath = mapPath;
		imagePaths = new ArrayList<String>();
		reviews = new ArrayList<Review>();
	}
	
	public static Attraction getByID(int id) {
		Map<String, Object> values = AttractionDao.getByID(id);
		if (values != null) {
			Attraction attraction = new Attraction(id, (String) values.get("name"), (Integer) values.get("cityID"),
					 (Integer) values.get("cost"), (Integer) values.get("openHour"), (Integer) values.get("closeHour"),
					 (Integer) values.get("hours"), (String) values.get("description"), (String) values.get("mapPath"));
			List<String> imagePaths = AttractionDao.getImagePaths(id);
			attraction.imagePaths.addAll(imagePaths);
			List<Review> reviews = Review.getAttractionReviews(id);
			User user;
			for (Review review: reviews) {
				review.linkAttraction(attraction);
				user = User.getByID(review.getUserID());
				review.linkUser(user);
			}
			attraction.reviews.addAll(reviews);
			return attraction;
		} else {
			return null;
		}
	}
	
	public static List<Attraction> getCityAttractions(int city_id) {
		List<Integer> ids = AttractionDao.getCityAttractionIDs(city_id);
		List<Attraction> attractions = new ArrayList<Attraction>();
		Attraction attraction;
		for (int id: ids) {
			attraction = getByID(id);
			attractions.add(attraction);
		}
		return attractions;
	}
	
	public void addImage(String imagePath) {
		imagePaths.add(imagePath);
	}
	
	public String getMapPath() {
		return mapPath;
	}
	
	public List<String> getImagePaths() {
		return imagePaths;
	}
	
	public List<Review> getReviews() {
		return reviews;
	}
	
	public String getOverallRating() {
		if (reviews.size() > 0) {
			float sum = 0;
			for (Review review: reviews) {
				sum += review.getRating();
			}
			Float overallRating = sum / reviews.size();
			return overallRating.toString();
		} else {
			return "N/A";
		}
	}
	
	public void linkCity(City city) {
		assert city.getID() == cityID;
		this.city = city;
	}
	
	public int getID() {
		return id;
	}
	
	public String getName() {
		return name;
	}
	
	public String getDescription() {
		return description;
	}
}
