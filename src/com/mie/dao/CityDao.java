package com.mie.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mie.util.DbUtil;

public class CityDao {
	
	public static Map<String, Object> getByID(int id) {
		Connection currentCon = null;
		ResultSet rs = null;
		Statement stmt = null;
		Map<String, Object> values; 
		String searchQuery = "select * from cities where city_id='" + (new Integer(id)).toString() + "'";
		try {
			currentCon = DbUtil.getConnection();
			stmt = currentCon.createStatement();
			rs = stmt.executeQuery(searchQuery);
			boolean more = rs.next();
			if (more) {
				values = new HashMap<String, Object>();
				values.put("name", rs.getString("city_name"));
				values.put("longitude", rs.getFloat("longitude"));
				values.put("latitude", rs.getFloat("latitude"));
				values.put("description", rs.getString("description"));
				values.put("mapPath", rs.getString("map_path"));
				return values;
			} else {
				return null;
			}
		} catch (Exception ex) {
			System.out.println("getByID failed: An Exception has occurred! " + ex);
			return null;
		}
	}
	
	public static List<String> getImagePaths(int id) {
		Connection currentCon = null;
		ResultSet rs = null;
		Statement stmt = null;
		List<String> paths = new ArrayList<String>();;
		String searchQuery = "select image_path from city_images where city_id_name='" + (new Integer(id)).toString() + "'";
		try {
			currentCon = DbUtil.getConnection();
			stmt = currentCon.createStatement();
			rs = stmt.executeQuery(searchQuery);
			while (rs.next()) {
				paths.add(rs.getString("image_path"));
			}
			return paths;
		}
		catch (Exception ex) {
			System.out.println("getImagePaths failed: An Exception has occurred! " + ex);
			return null;
		}
	}
	
	public static List<Integer> getAllCityIDs() {
		Connection currentCon = null;
		ResultSet rs = null;
		Statement stmt = null;
		List<Integer> ids = new ArrayList<Integer>();;
		String searchQuery = "select city_id from cities";
		try {
			currentCon = DbUtil.getConnection();
			stmt = currentCon.createStatement();
			rs = stmt.executeQuery(searchQuery);
			while (rs.next()) {
				ids.add(rs.getInt("city_id"));
			}
			return ids;
		} catch (Exception ex) {
			System.out.println("getAllCityIDs failed: An Exception has occurred! " + ex);
			return null;
		}
	}
}
