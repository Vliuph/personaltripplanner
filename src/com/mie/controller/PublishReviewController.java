package com.mie.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mie.dao.DuplicateUserException;
import com.mie.dao.PasswordMismatchException;
import com.mie.model.Attraction;
import com.mie.model.Review;
import com.mie.model.User;

public class PublishReviewController extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {
		Review review;
		try {
			String username = request.getParameter("username");
			String text = request.getParameter("review_text");
			int attraction_id = Integer.parseInt(request.getParameter("attraction_id"));
			int rating = Integer.parseInt(request.getParameter("rating"));
			User user = User.getByUsername(username);
			Attraction attraction = Attraction.getByID(attraction_id);
			review = new Review(user, attraction, text, rating);
			response.sendRedirect("attraction_details.jsp?attraction_id=" + request.getParameter("attraction_id"));

		} catch (Throwable theException) {
			System.out.println(theException);
		}
	}
}
