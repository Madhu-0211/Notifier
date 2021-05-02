<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login page</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma","no-cache");
response.setHeader("Expires","0");

%>
	<div class="login">
		<div class="form">
			<form action="LoginSer" method="post">
				<h1>
					Remind Me
				</h1>
				<h2>Login</h2>
				<input type="email" name="email" placeholder="Email" /><br> <input
					type="password" name="password" placeholder="Password" /><br>
				<button>LOGIN</button>
				<p class="message">
					Not Regitered? <a href="Signup.jsp">Sign up</a>
				</p>
				<%String msg=request.getParameter("msg");
				if("not".equals(msg))
				{%>
				<h4 style="color:teal">Invalid Username or Password</h4>
				<% }%>
			
			</form>
			
		</div>
	</div>
</body>
</html>