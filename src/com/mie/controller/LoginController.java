package com.mie.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mie.model.*;
import com.mie.dao.*;

public class LoginController extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {
		User user;
		try {
			user = new User(request.getParameter("username"), request.getParameter("password"));
			HttpSession session = request.getSession(true);
			session.setAttribute("username", user.getUsername());
			response.sendRedirect("home.jsp");
			session.setMaxInactiveInterval(900); // TODO must shorten interval
		} catch (WrongUsernamePasswordException theException) {
			response.sendRedirect("home.jsp?login_failed=true");
		} catch (Throwable theException) {
			System.out.println(theException);
		}
	}
}
