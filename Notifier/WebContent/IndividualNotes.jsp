<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Individual Notes</title>
<link rel="stylesheet" href="style1.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script type = "text/javascript"  
            src = 
"https://code.jquery.com/jquery-2.1.1.min.js">
    </script> 

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
	Connection con = null;
	PreparedStatement ps = null;
	PreparedStatement ps2 = null;
	String url = "jdbc:mysql://localhost:3306/table1?allowPublicKeyRetrieval=true&useSSL=false";
	String user = "root";
	String sql = "SELECT * from addnote where email=? AND nname=? ";
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
				<li><a
					href="Addnote.jsp?nbname=<%=request.getParameter("nbname")%>&nbid=<%=request.getParameter("nbid")%>"><i
						class="fas fa-book-open fa-lg" style="padding: 15px">&nbsp;<span
							style="font-size: 17px; font-family: sans-serif; font-weight: normal">New
								Note</span></i> </a></li>
				<li><a href="LogoutServlet"><b>Logout</b></a></li>

			</ul>

		</div>
	</nav>

	<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(url, user, "examly");
		ps = con.prepareStatement(sql);
		ps.setString(1, email);
		ps.setString(2, request.getParameter("nbname"));
		ResultSet rs = ps.executeQuery();
		boolean check = rs.next();
		if (!check) {
	%>
	<h5 style="text-align: center">No notes are created</h5>

	<%
	} else {
	%>
	<h4 style="margin-left: 270px;">Notes</h4>
	<%
	rs = ps.executeQuery();
	while (rs.next()) {
		int id = rs.getInt("id");
		String nName = rs.getString("notename");
		String start = rs.getString("start");
		String end = rs.getString("end");
		String status = rs.getString("status");
		String des = rs.getString("des");
	%>
	<div class="container">
		<div class="row">
			<div class="col m11 s12 grey lighten-3">
				<div class="card">
					<div class="card-content grey lighten-5">
						<ul class="right">
							<li><a class="teal-text" href="DeleteNote?nName=<%=nName%>&id=<%=id %>&nbid=<%=request.getParameter("nbid") %>"
								class="Delete"><i class='fas fa-trash-alt'></i>&nbsp;Delete</a></li>
							<li><a class="teal-text"
								href="EditNote.jsp?oldname=<%=nName%>&id=<%=id%>" class="edit"><i
									class='fas fa-edit'></i>&nbsp;Edit</a></li>
						</ul>
						<div class="card-title">
							<a class="teal-text"><b> <%=nName%></b></a>
						</div>
						Start Date:
						<%=start%>&nbsp;&nbsp;&nbsp;&nbsp;<a class="waves-effect waves-light btn"><%=status%></a><br>
					End Date:
						<%=end%><br>
						<ul class="collapsible" style="width:20%";>
									<li>
              <div class="collapsible-header grey lighten-5">
                <i class="material-icons" style="padding:4px";>add
                      </i></div>
              <div class="collapsible-body">
                     <p><%=des %></p></div>
            
									</li></ul>

					</div>
				</div>
			</div>
		</div>
	</div>

	<%
	}
	}
	} catch (Exception e) {
	out.println(e);
	}
	%>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://kit.fontawesome.com/52bf741a29.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>
		<script src=
"https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js">
      </script>   
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