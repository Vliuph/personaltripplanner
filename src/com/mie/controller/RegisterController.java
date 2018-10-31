package com.mie.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mie.dao.DuplicateUserException;
import com.mie.dao.PasswordMismatchException;
import com.mie.model.User;

public class RegisterController extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {
		User user;
		try {
			user = new User(request.getParameter("username"), request.getParameter("password"), request.getParameter("passwordConfirm"));
			HttpSession session = request.getSession(false);
			session.invalidate();
			response.sendRedirect("home.jsp");
		} catch (DuplicateUserException theException) {
			response.sendRedirect("register.jsp?duplicate_user=true");
		} catch (PasswordMismatchException theException) {
			response.sendRedirect("register.jsp?password_mismatch=true");
		} catch (Throwable theException) {
			System.out.println(theException);
		}
	}
}
