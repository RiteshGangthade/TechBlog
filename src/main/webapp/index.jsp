<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.Posts"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.tech.blog.helper.ConHelp"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/myStyle.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
	<%@ include file="normal_nav.jsp"%>

	<div class="container-fluid p-0 m-0">
		<div class="jumbotron">
			<div class="container">
				<h3 class="display-3">Welcome To TechBlog</h3>
				<p>Welcome to TechBlog, your ultimate destination for staying
					updated on the latest trends, breakthroughs, and innovations in the
					world of technology. Whether you're a tech enthusiast, a seasoned
					developer, or someone simply curious about the rapidly evolving
					tech landscape, TechBlog is here to inform, educate, and inspire.
					Dive into our comprehensive articles, insightful analyses, and
					expert opinions covering a wide array of topics, including
					artificial intelligence, blockchain, cybersecurity, data science,
					internet of things (IoT), cloud computing, and much more. Stay
					ahead of the curve and explore the endless possibilities that
					technology offers with TechBlog.</p>
				<ul>
			     <a href="register.jsp"  class="btn btn-outline-dark">Sign-up</a>
				<a href="Login.jsp"  class="btn btn-outline-dark">Login</a></ul>
			</div>

		</div>

</div>
	<br></br>
	<div class="row">
<%
    PostDao pd = new PostDao(ConHelp.getConnection());
    List<Posts> postList = pd.getAllPost();
    
    // Iterate through the list of posts and display them
    for (Posts post : postList) {
%>

    <div class="col-md-4 my-3">
        <div class="card">
            <div class="card-body">
            <img class="card-image-top" alt="Card image cap"
							src="img/programming.jpeg" width=400>
                <h5 class="card-title"><%= post.getpTitle() %></h5>
                <p class="card-text"><%= post.getpContext() %></p>
                <!-- Add any additional content you want to display for each post -->
            </div>
            <div class="card-footer bf-light text-center">
			<% LikeDao ld = new LikeDao(ConHelp.getConnection());
			%>
						
			
			
			
			
			<a href="show_blog.jsp?post_id=<%=post.getPid() %>" class="btn btn-outline-primary btn-sm">Read more</a>
			
			</div>
        </div>
    </div>
<%
    }
%>

</div>

	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script src="js/myJs.js" type="text/javascript"></script>
</body>
</html>