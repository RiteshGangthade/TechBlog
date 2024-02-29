<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Posts"%>
<%@page import="com.tech.blog.helper.ConHelp"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.user"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="Errorpage.jsp"%>

<%
user us1 = (user) session.getAttribute("currentUser");
if (us1 == null) {
	response.sendRedirect("Login.jsp");
}
%>
<%
int postId = Integer.parseInt(request.getParameter("post_id"));
PostDao pd = new PostDao(ConHelp.getConnection());
UserDao ud=new UserDao(ConHelp.getConnection());
Posts p = pd.getPostById(postId);
%>

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
<style>
.post-content{
	font-weight:100;
	font-size:20px;
}
.post-id{

font-style:Italic;
}
.post-date{
 font-size:12px;
}
.row-user{
border:1px solid #e2e2e2;

}
body{
background:url(img/back3.jpeg);
background-size:cover;
background-attachmenet:fixed;
}
</style>
<meta charset="ISO-8859-1">
<title><%=p.getpTitle()%></title>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v19.0" nonce="zH1Uxzb2"></script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light primary-background">
		<a class="navbar-brand" href="index.jsp"><span
			class="fa fa-asterisk fa-spin"></span>TechBlog</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#"><span
						class="fa fa-bell-o"></span>RiteshGangthade<span class="sr-only">(current)</span></a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <span class="fa fa-anchor"></span>categories
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Programming Knowledge</a> <a
							class="dropdown-item" href="#">Projects</a> <a
							class="dropdown-item" href="#">DSA</a>
					</div></li>

				<li class="nav-item active"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#do-post"><span
						class="fa fa-arrow-right"></span>Do Post<span class="sr-only">(current)</span></a></li>


			</ul>
			<ul class="navbar-nav mr-right">

				<a class="nav-link" href="#!" data-toggle="modal"
					data-target="#profile-modal"><span class="fa fa-user-circle"></span><%=((user) session.getAttribute("currentUser")).getName()%></a>
				<a class="nav-link" href="LogoutServlet">Logout</a>
			</ul>

			<!-- Button trigger modal -->


			<!-- Modal -->
			<div class="modal fade" id="do-post" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header primary-background">
							<h5 class="modal-title" id="exampleModalLabel">Please fill
								carefully..</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form id="do-post-form" action="AddPostServlet" method="POST"
								enctype="multipart/form-data">
								<div class="form-group">
									<select class="form-control" name="cid">
										<option selected disable>---select category---</option>
										<%
										PostDao postd = new PostDao(ConHelp.getConnection());
										ArrayList<Category> list = postd.getAllCategories();
										for (Category c : list) {
										%>
										<option value="<%=c.getCid()%>"><%=c.getCname()%></option>


										<%
										}
										%>

									</select>

								</div>
								<div class="form-group">
									<input name="pTitle" type="text"
										placeholder="Enter the title of your post"
										class="form-control">
								</div>
								<div class="form-group">
									<textarea name="pContent" rows="10" cols="6"
										placeholder="Enter the content on your post"
										class="form-control"></textarea>

								</div>
								<div class="form-group">
									<textarea name="pCode" rows="10" cols="6"
										placeholder="Enter the coding part(if aplicable))"
										class="form-control"></textarea>

								</div>
								<div class="form-control">
									<p>select picture if you want to add</p>
									<input type="file" class="form-control" name="image">
								</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary">Post</button>
						</div>
						</form>
					</div>
				</div>
			</div>




		</div>
	</nav>

	<!-- main body -->
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">

					<div class="card-header">
						<h3 class="post-title"><%=p.getpTitle()%></h3>

					</div>
					<div class="card-body">
						<img class="card-image-top" alt="Card image cap"
							src="img/programming.jpeg" width=500 height=300>

						<div class="row my-3 row-user">
							<div class="col-md-6">
								<p><a class="post-id" href=""><%=ud.getUserById(p.getUserId()).getName()%></a> Posted this on:</p>
							</div>
							<div class="col-md-4">
                               <p><a class="post-date"><%=DateFormat.getDateInstance().format(p.getpDate())%></a></p>
							</div>


						</div>

						<p class="post-content"><%=p.getpContext()%></p>


						<br></br> <br></br>
						<div class="post-code">
							<pre><%=p.getpCode()%></pre>
						</div>
					</div>
					<div class="card-footer bf-light text-center">
						<% LikeDao ld = new LikeDao(ConHelp.getConnection()); %>
						<a href="#!"
							onclick="doLike(<%=p.getPid() %>, <%=us1.getIdl() %>)"
							class="btn btn-outline-primary btn-sm"> <i
							class="fa fa-thumbs-o-up"></i> <span class="like-count"><%= ld.countLike(p.getPid()) %></span>
							
						</a> <a href="#!" class="btn btn-outline-primary btn-sm"> <i
							class="fa fa-commenting-o"></i> <span>20</span>
						</a>
				

                  
                    <div class="fb-comments" data-href="http://localhost:9192/TechBlog/show_blog.jsp?post_id=<%=p.getPid() %>" data-width="" data-numposts="5"></div>
                    
                    
                    </div>
                  

				</div>


			</div>

		</div>

	</div>





	<!-- Button trigger modal -->


	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-dark text-center">
					<h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body text-center">
					<img src="profile_pics/profile.png" width="50" height="50">
					<h5 class="modal-title" id="exampleModalLabel"><%=((user) session.getAttribute("currentUser")).getName()%></h5>

					<div id="profile-details">


						<table class="table table-dark">

							<tbody>
								<tr>
									<th scope="row">ID</th>
									<td><%=((user) session.getAttribute("currentUser")).getIdl()%></td>

								</tr>
								<tr>
									<th scope="row">Email</th>
									<td><%=((user) session.getAttribute("currentUser")).getEmail()%></td>

								</tr>
								<tr>
									<th scope="row">Gender</th>
									<td><%=((user) session.getAttribute("currentUser")).getGender()%></td>

								</tr>
								<tr>
									<th scope="row">About</th>
									<td><%=((user) session.getAttribute("currentUser")).getAbout()%></td>

								</tr>
								<tr>
									<th scope="row">Registered On</th>
									<td><%=((user) session.getAttribute("currentUser")).getDateTime()%></td>

								</tr>
							</tbody>
						</table>
					</div>



					<div id="profile-edit" style="display: none;">

						<h3>Please Edit Carefully</h3>
						<form action="EditServlet" method="POST"
							enctype="multipart/form-data">
							<table class="table">
								<tbody>
									<tr>
										<th scope="row">ID</th>
										<td><%=((user) session.getAttribute("currentUser")).getIdl()%></td>

									</tr>
									<tr>
										<th scope="row">Name</th>
										<td><input type="text" class="form-control"
											name="user-name"
											value="<%=((user) session.getAttribute("currentUser")).getName()%>"></td>

									</tr>
									<tr>
										<th scope="row">Email</th>
										<td><input type="email" class="form-control"
											name="user-email"
											value="<%=((user) session.getAttribute("currentUser")).getEmail()%>"></td>

									</tr>
									<tr>
										<th scope="row">Password</th>
										<td><input type="password" class="form-control"
											name="user-passward"
											value="<%=((user) session.getAttribute("currentUser")).getPassward()%>"></td>

									</tr>
									<tr>
										<th scope="row">Gender</th>
										<td><%=((user) session.getAttribute("currentUser")).getGender()%></td>

									</tr>
									<tr>
										<th scope="row">About</th>
										<td><textarea rows="3" class="form-control"
												name="user-about"><%=((user) session.getAttribute("currentUser")).getAbout()%>
										</textarea></td>

									</tr>






								</tbody>



							</table>
							<div class="Container">

								<button type="submit"
									class="btn btn-outline-primary text-center">Save</button>
							</div>


						</form>

					</div>



				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="edit-p-btn" type="button" class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
		integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="js/myJs.js" type="text/javascript"></script>
	<script>
		$(document).ready(function(e) {

			$("#do-post-form").on("submit", function(event) {

				event.preventDefault();

				let form = new FormData(this);

				$.ajax({
					url : "AddPostServlet",
					type : "POST",
					data : form,
					success : function(data, textStatus, jqXHR) {
						if (data.trim()) {
							swal("Good job!", "Post Successful", "success");
						} else {
							swal("Oops.....!", "Post failed", "error");
						}

					},
					error : function(jqXHR, textStatus, errorThrown) {
						swal("Oops.....!", "Post failed", "error");
						console.log(error);
					},
					processData : false,
					contentType : false

				})

			})

		});
	</script>



	<script>
		function getPost(cid, t) {

			$(".c-link").removeClass('active'), $.ajax({
				url : "load_post.jsp",
				data : {
					c : cid
				},
				success : function(data, textStatus, jqXHR) {
					console.log(cid), $("#loader").hide(),

					$("#post-container").html(data), $(t).addClass('active');
				}

			})
		}

		$(document).ready(function(e) {

			getPost(0);

		})
	</script>
</body>
</html>