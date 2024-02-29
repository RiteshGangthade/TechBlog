package com.tech.blog.servlets;

import java.io.IOException;
import java.io.OutputStreamWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.*;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.user;



import com.tech.blog.helper.ConHelp;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userEmail = request.getParameter("e");
		//System.out.println(userEmail);
		String userPassward = request.getParameter("p");
		//System.out.println(userPassward);

		UserDao ud = new UserDao(ConHelp.getConnection());

		user us1 = ud.getUserByemailandpass(userEmail, userPassward);
		//System.out.println(us1);
		if (us1 == null) {

			Message msg = new Message("Invalid input", "error", "alert-danger");
			HttpSession s = request.getSession();
			s.setAttribute("msg", msg);

			response.sendRedirect("Login.jsp");

		} else {

			HttpSession s = request.getSession();
			s.setAttribute("currentUser", us1);
			response.sendRedirect("profile.jsp");
			//System.out.println(us1.getName());
		}

	}

}
