package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.tech.blog.entities.*;
import com.tech.blog.helper.*;
import com.tech.blog.dao.*;

@WebServlet("/registerServlet")
@MultipartConfig
public class registerServlet extends HttpServlet {
   

    public registerServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String check = request.getParameter("check");
        PrintWriter out = response.getWriter();
       
        if (check==null) {
        	out.print("Please accept term and conditions");
			
		} else {
            String name=request.getParameter("uname");
            String email=request.getParameter("email");
            String passward=request.getParameter("passward");
            String gender=request.getParameter("gender");
            String about=request.getParameter("about");
            
            user us=new user(name,email,passward,gender,about);
            UserDao dao=new UserDao(ConHelp.getConnection());
            if (dao.saveUser(us)) {
				out.print("done");
				
			} else {
				
				
				
				out.print("error");

			}
            
            
		}
    }
}
