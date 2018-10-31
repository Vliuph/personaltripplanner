package com.mie.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.mie.dao.CityDao;

public class City {
	
	int id;
	String name;
	String description = "Pellentesque habitant morbi tristique senectus et netus et malesuada "
			+ "fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, "
			+ "tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies "
			+ "mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper "
			+ "pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. "
			+ "Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus "
			+ "lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, "
			+ "neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. "
			+ "Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus";
	float longitude;
	float latitude;
	String mapPath;
	List<String> imagePaths;
	List<Attraction> attractions;
	
	private City(int id, String name, float longitude, float latitude, String description, String mapPath) {
		this.id = id;
		this.name = name;
		if (description != null && description.length() > 0) {
			this.description = description;
		}
		this.longitude = longitude;
		this.latitude = latitude;
		this.mapPath = mapPath;
		imagePaths = new ArrayList<String>();
		attractions = new ArrayList<Attraction>();
	}

	public static City getByID(int id) {
		Map<String, Object> values = CityDao.getByID(id);
		if (values != null) {
			City city = new City(id, (String) values.get("name"), (Float) values.get("longitude"),
					(Float) values.get("latitude"), (String) values.get("description"), (String) values.get("mapPath"));
			List<String> imagePaths = CityDao.getImagePaths(id);
			city.imagePaths.addAll(imagePaths);
			List<Attraction> attractions = Attraction.getCityAttractions(id);
			for (Attraction attraction: attractions) {
				attraction.linkCity(city);
			}
			city.attractions.addAll(attractions);
			return city;
		} else {
			return null;
		}
	}
	
	public static List<City> getAllCities() {
		List<Integer> ids = CityDao.getAllCityIDs();
		List<City> cities = new ArrayList<City>();
		City city;
		for (int id: ids) {
			city = getByID(id);
			cities.add(city);
		}
		return cities;
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
	
	public void addImage(String imagePath) {
		imagePaths.add(imagePath);
	}
	
	public String getMapPath() {
		return mapPath;
	}
	
	public List<String> getImagePaths() {
		return imagePaths;
	}
	
	public List<Attraction> getAttractions() {
		return attractions;
	}
	
	public String getMapLink() {
		String link = String.format("http://www.google.com/maps/place/%f,%f", latitude, longitude);
		return link;
	}
} 
