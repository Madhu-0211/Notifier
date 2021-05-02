<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="style1.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style1.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<title>AddNote</title>
</head>
<style>
.container {
	border: 2px ridge #eceff1;
	width: 550px;
	padding: 0 5px 0;
	margin: 30px auto;
}

.form label {
	color: teal;
	font-weight: 500;
}

::placeholder {
	color: black;
}
</style>
<body>

	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");

	String email = (String) session.getAttribute("email");
	if (email == null) {
		response.sendRedirect("index.jsp");
	}
	%>
	<%
	String url = "jdbc:mysql://localhost:3306/table1?allowPublicKeyRetrieval=true&useSSL=false";
	Connection con = null;
	String query = "select * from newnotebook where nname=?";
	PreparedStatement ps = null;
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
	<div id="addnote" class="form">
		<div class="container grey lighten-4">
			<div class="row ">
				<h5 style="text-align: center; color: teal;">
					<b><%=request.getParameter("nbname")%></b>
					
				</h5>
				<br>
				<div class="col s7">
					<form action="AddnoteSer?nname=<%=request.getParameter("nbname")%>"
						method="post">
						<input type="hidden" name="nbid"
							value="<%=request.getParameter("nbid")%>"> <label
							for="notename">NoteName</label> <input type="text"
							name="notename" placeholder="NoteName" required><br>
						<label for="start">StartDate</label> <input type="date"
							name="start" placeholder="StartDate" required> <label
							for="end">EndDate</label> <input type="date" name="end"
							placeholder="EndDate" required> <label for="Remainder">RemainderDate</label>
						<input type="date" name="Remainder" placeholder="RemainderDate"
							required>

						<div class="row">
							<div class="input-field col s7">
								<select name="Status">
									<option value="Started">Started</option>
									<option value="Not started">Not Started</option>
								</select><label>Status</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s7">
								<select name="Tag">
									<option value="Private">Private</option>
									<option value="Public">Public</option>

								</select><label>Tag</label>
							</div>
						</div>

						<label>Description</label><br>
						<br>
						<textarea name="des" placeholder="Description" required></textarea>
						<br>
						<br>
						<button class="waves-effect waves-light btn">Submit</button>

					</form>
				</div>
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
		$(document).ready(function() {
			$('select').formSelect();
		});
	</script>

</body>
</html>