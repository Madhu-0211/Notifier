<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Notebooks</title>
<link rel="stylesheet" href="style1.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
</head>

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
	String query = "select * from newnotebook where email=?";
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
				<li><a href="javascript:void(0)"><span id="email_id"
						style="font-size: small;"> <%=email%></span></a></li>
				<li><a href="Notebooks.jsp">Notebooks</a></li>
				<li><a href="dashboard.jsp">Notes</a></li>
				<li><a href="Edituser.jsp">Edit User</a></li>

			</ul>

			<ul class="right" id="rightside">

				<li><a href="NewNotebook.jsp"><i class="fas fa-book fa-lg"
						style="padding: 15px">&nbsp;<span
							style="font-size: 17px; font-family: sans-serif; font-weight: normal; top: 15px">New
								Notebook</span></i></a></li>
				<li><a href="LogoutServlet"><b>Logout</b></a></li>

			</ul>

		</div>
	</nav>
	<%
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, "root", "examly");
			ps = con.prepareStatement(query);

			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			boolean check = rs.next();
			if (!check) {
		%>
	<h5 style="text-align: center">Create new notebook</h5>

	<%
		} else {%>
	<h4 style="margin-left: 270px;">Note Books</h4>
	<% 
		rs = ps.executeQuery();
		while (rs.next()) {
			String nname = rs.getString("nname");
			int count = rs.getInt("count");
			int id = rs.getInt("id");
		%>
	<div class="container">
		<div class="row ">
			<div class="col s11">
				<div class="card">
					<div class="card-content grey lighten-5">
						<ul class="right">
							<li><a class="teal-text"
								href="DeleteNotebook?nName=<%=nname%>&id=<%=id%>" class="Delete"><i
									class='fas fa-trash-alt'></i>&nbsp;Delete</a></li>
							<li><a class="teal-text"
								href="EditNotebooks.jsp?oldname=<%=nname%>&id=<%=id%>"
								class="edit"><i class='fas fa-edit'></i>&nbsp;Edit</a></li>
						</ul>
						<div class="card-title">
							<a class="teal-text"
								href="IndividualNotes.jsp?nbname=<%=nname%>&nbid=<%=id%>"><b><%=nname%></b></a>
						</div>
						<b>No of Notes : </b><%=count%>

					</div>
				</div>
			</div>
		</div>
	</div>

	<%
		}
		}
		} catch (Exception e) {
		System.out.print(e);
		}
		%>
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
