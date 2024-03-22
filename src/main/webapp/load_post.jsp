<%@page import="com.tech.blog.entities.user"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.Posts"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConHelp"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<div class="row">

	<%
	user us1=(user)session.getAttribute("currentUser");
	PostDao pd = new PostDao(ConHelp.getConnection());
	List<Posts> post = null;
	int cid=0;
	cid = Integer.parseInt(request.getParameter("c"));
	if (cid == 0){
		post = pd.getAllPost();
	}else{
		//System.out.println(cid);
		post=pd.getPostByCid(cid);
	}
	if(post.size()==0){
		out.println("<h1 class='display-3 text-center'>Nothing in this category<h1>");
	}

	for (Posts p : post) {
	%>
	<div class="col-md-6 mt-3">
		<div class="card">
	
			<div class="card-body">
			<img class="card-image-top" alt="Card image cap"
							src="img/programming.jpeg" >
				<b><%=p.getpTitle()%></b>
				<p><%=p.getpContext()%></p>
			

			</div>
			<div class="card-footer bf-light text-center">
			<% LikeDao ld = new LikeDao(ConHelp.getConnection());
			%>
						<button href="#!"
							
							class="btn btn-outline-primary btn-sm"> <i
							class="fa fa-thumbs-o-up"></i> <span><%= ld.countLike(p.getPid()) %></span>
							
						</button>
			
			
			
			
			
			<a href="show_blog.jsp?post_id=<%=p.getPid() %>" class="btn btn-outline-primary btn-sm">Read more</a>
			
			</div>

		</div>


	</div>


	<%
	}
	%>
</div>