package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Posts;
import com.tech.blog.entities.user;
import com.tech.blog.helper.ConHelp;
import com.tech.blog.helper.Helper;

@MultipartConfig
@WebServlet("/AddPostServlet")
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AddPostServlet() {
        super();
        
    }

	
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pTitle=request.getParameter("pTitle");
		String cidString = request.getParameter("cid");
		int cid = Integer.parseInt(cidString);

		String pContent=request.getParameter("pContent");
		String pCode=request.getParameter("Pcode");
		//Part part=request.getPart("image");
		HttpSession session=request.getSession();
		user us=(user)session.getAttribute("currentUser");
		PrintWriter out=response.getWriter();
		
		Posts p=new Posts(pTitle,pContent,pCode,null,null,cid,us.getIdl());
		PostDao pd=new PostDao(ConHelp.getConnection());
		if(pd.savePost(p)) {
	      	
			//String uploadDir = getServletContext().getRealPath("/img");
		//	String path= uploadDir + File.separator + part.getSubmittedFileName();

			//Helper.saveFie(part.getInputStream(),path);

	      	out.println("updated successfully");
	       response.sendRedirect("profile.jsp");
		}else {
			//out.println("error...........");
		}
		
		
		
		//System.out.println(pTitle);
		//PrintWriter out=response.getWriter();
		//out.println(part.getSubmittedFileName());
		
		
		
	}

}
