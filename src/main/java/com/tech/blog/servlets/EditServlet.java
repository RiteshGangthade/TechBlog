package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.user;
import com.tech.blog.helper.ConHelp;

@MultipartConfig
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditServlet() {

		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userName = request.getParameter("user-name");
		String userEmail = request.getParameter("user-email");
		String userPassword = request.getParameter("user-passward");
		String userAbout = request.getParameter("user-about");
		
		

		PrintWriter out=response.getWriter();
//		out.println(userName);
//		out.println(userEmail);
//		out.println(userPassword);
//		out.println(userAbout);

		HttpSession s = request.getSession();
		user us2 = (user) s.getAttribute("currentUser");
		us2.setName(userName);
		us2.setEmail(userEmail);
		us2.setPassward(userPassword);
		us2.setAbout(userAbout);
		

		UserDao usd = new UserDao(ConHelp.getConnection());
		boolean t = usd.updateUser(us2);
		if(t) {response.sendRedirect("profile.jsp");}else {
			out.println("Something going wrong");
		}
	
//        if(t) {
//        	//out.print("Updated");
//        	String path=request.getServletContext().getRealPath("/profile_pic/")+imageName;
//        	out.println(path);
//        	
//        	if(Helper.deleteFile(path)) {
//        	    response.sendRedirect("profile.jsp");
//        		out.println("profile updaed");
//        	}
//        	
//        }else {
//        	out.print("Not Updated");
//        }
	}

	   
	}


