<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Note</title>
<link rel="stylesheet" href="style1.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
</head>
<style>
.container {
	border: 2px solid #eceff1;
	width: 450px;
	padding: 0% 0 0;
	margin: 40px auto;
}

</style>
<body>
	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");
	String email = (String) session.getAttribute("email");
	if (session.getAttribute("email") == null) {
		response.sendRedirect("index.jsp");
	}
	%>

	<nav class="nav-wrapper teal accent-4">
		<div>
			<a href="" class="sidenav-trigger show-on-large"
				data-target="mobile-menu"> <i class="material-icons">menu</i>
			</a>
			<ul class="sidenav" id="mobile-menu">
				<li><a href="" data-target="slide-out"><i
						class="material-icons right">close</i></a></li>
				<li><a href="javascript:void(0)"><span id="email_id" style="font-size:small;">
							<%=email%></span></a></li>
				<li><a href="Notebooks.jsp">Notebooks</a></li>
				<li><a href="dashboard.jsp">Notes</a></li>
				<li><a href="Edituser.jsp">Edit User</a></li>

			</ul>

			<ul class="right" id="rightside">
				<li><a href="LogoutServlet"><b>Logout</b></a></li>

			</ul>

		</div>
	</nav>
	<div class="container grey lighten-3">

		<div class="row">
			<h5 style="text-align: center; color: teal">
				<b>Edit Note</b>
			</h5>

			<div class="col s6">
				<label style="color: teal;font-weight: 500; font-size:large";>Old Name
						:</label>
				<form action="EditNotes">
				<input type="hidden" name="id"
						value="<%=request.getParameter("id")%>"> <input
						value="<%=request.getParameter("oldname")%>" name="oldname"
						readonly> <label style="color: teal;font-weight: 500; font-size:large;">New
							Name</label> <input type="text" name="newname" required><br>
							<label style="color: teal;font-weight: 500; font-size:large;" for="start">StartDate</label> <input type="date"
							name="start" placeholder="StartDate" required> <label style="color: teal;font-weight: 500; font-size:large;"
							for="end">EndDate</label> <input type="date" name="end"
							placeholder="EndDate" required> <label style="color: teal;font-weight: 500; font-size:large;" for="Remainder">RemainderDate</label>
						<input type="date" name="Remainder" placeholder="RemainderDate"
							required>
						<label style="color: teal;font-weight: 500; font-size:large;">Description</label><br>
						<br>
						<textarea name="des" required></textarea>
						<br>
						<br>
							
					<button class="waves-effect waves-light btn">Save</button>
				</form>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://kit.fontawesome.com/52bf741a29.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var elems = document.querySelectorAll('.sidenav');
			var instances = M.Sidenav.init(elems, options);
		});

		$(document).ready(function() {
			$('.sidenav').sidenav();

		});
	</script>
</body>
</html>