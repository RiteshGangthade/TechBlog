<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

<meta charset="ISO-8859-1">
<title>register page</title>
</head>
<body>
	<%@include file="normal_nav.jsp"%>
	<form id="reg-form" action="registerServlet" method="POST">

		<div class="Container">

			<div class="col-md-4 offset-md-4">
				<div class="card">

					<div class="card-header text-center">
						<span class="fa fa-3x fa-user-circle"></span>


						<h1>Register</h1>
					</div>
					<div class="card-body"></div>
					<div class="form-group">
						<label for="User name">User Name</label> <input name="uname"
							type="user_name" class="form-control" id="uname"
							placeholder="Enter user name">

					</div>




					<div class="form-group">
						<label for="exampleInputEmail1">Email address</label> <input
							name="email" type="email" class="form-control"
							id="exampleInputEmail1" aria-describedby="emailHelp"
							placeholder="Enter email"> <small id="emailHelp"
							class="form-text text-muted">We'll never share your email
							with anyone else.</small>
					</div>





					<div class="form-group">
						<label for="exampleInputPassword1">Password</label> <input
							name="passward" type="password" class="form-control"
							id="exampleInputPassword1" placeholder="Password">
					</div>

					<div class="form-group">
						<label for="gender">Select Gender</label> <br> <input
							type="radio" id="male" name="gender" value="male">Male <input
							type="radio" id="female" name="gender" value="female">Female
					</div>


					<div class="form-group">

						<textarea name="about" id="form-control" cols="60" rows="5"
							placeholder="write something about you"></textarea>
					</div>





					<div class="form-check">
						<input name="check" type="checkbox" class="form-check-input"
							id="exampleCheck1"> <label class="form-check-label"
							for="exampleCheck1">agree T&C</label>
					</div>
					<br></br>
					<button type="submit" class="btn btn-primary ">Submit</button>
				</div>




				<div class="card-footer"></div>
			</div>



		</div>
		</div>



	</form>










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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
		integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<script>
	$(document).ready(function(){
		
		console.log("loaded....")
		
		
		$('#reg-form').on('submit',function(event){
			
			event.preventDefault();
			
			
			let form=new FormData(this);
			
			
			$.ajax({
				url:"registerServlet",
				type:'POST',
				data:form,
				success:function(data,textStatus,jqXHR){
					console.log(data);
					if(data.trim()==='done'){
					
					swal("Information saved successfully")
					.then((value) => {
					  window.location="Login.jsp";
					});
				}else{
					swal(data);
				}
				},
				error:function(jqXHR,textStatus,errorThrown){
					console.log(jqXHR);
					swal("Please try again");
					
					
					
				},
				processData:false,
				contentType:false
			})
		})
		
		
		
	})
	
	
	
	
	</script>




</body>
</html>
