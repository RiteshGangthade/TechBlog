package com.tech.blog.servlets;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.LikeDao;
import com.tech.blog.helper.ConHelp;


@WebServlet("/LikeServlet")
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LikeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String operation=request.getParameter("operation");
		int pid=Integer.parseInt(request.getParameter("pid"));
		int uid=Integer.parseInt(request.getParameter("uid"));
        PrintWriter out=response.getWriter();
//        System.out.println("data from js: ");
//        System.out.println(operation);
//        System.out.println("pid: "+pid);
//        System.out.println("uid: "+uid);
//        
        LikeDao ld=new LikeDao(ConHelp.getConnection());
        if(operation.equals("like")) {
        	boolean f=ld.insertLike(pid, uid);
        	out.println(f);
        }
		
	}

}
