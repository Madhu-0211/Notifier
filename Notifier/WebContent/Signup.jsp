<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Signup page</title>
<link rel="stylesheet" href="style.css">
</head>
<body>

	<div class="Signup">
		<div class="form">
			<form action="SignupServlet" method="post">
				<h2>Signup</h2>
				<input type="text" name="username" placeholder="Username" /><br>
				<input type="text" name="number" placeholder="Mobile Number" /><br>
				<input type="email" name="email" placeholder="Email Address" /><br>
				<input type="password" name="password" placeholder="Password" /><br>
				<input type="password" name="conform" placeholder="Conform Password" /><br>
				<button>Submit</button>
				<p class="message">
					Already Registered? <a href="index.jsp">Login</a>
				</p>
				

			</form>
		</div>
	</div>


</body>
</html>