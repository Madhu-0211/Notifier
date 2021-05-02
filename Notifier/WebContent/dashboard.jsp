<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*,java.time.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
<link rel="stylesheet" href="style1.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">

            
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script type = "text/javascript"  
            src = 
"https://code.jquery.com/jquery-2.1.1.min.js">
    </script> 

</head>
<style>
#notification {
	position: absolute;
	right: 0;
	padding: 10px;
	border: 2px solid #00bfa5;
	background-color: #eeeeee;
	border-radius: 5px;
	width: 350px;
	margin: 5px;
	z-index: 10;
	display: none;
}

#alert li {
	padding: 10px;
	margin: 10px;
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
	LocalDate ld=LocalDate.now();
	String pDate=ld.toString();
	boolean result=false;
	Connection con = null;
	PreparedStatement ps = null;
	PreparedStatement ps2 = null;
	String url = "jdbc:mysql://localhost:3306/table1?allowPublicKeyRetrieval=true&useSSL=false";
	String user = "root";
	String sql = "SELECT * from addnote where email=?";
	String sql1= "SELECT username from signup where email=?";
	try {
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection(url, "root","examly");
		ps=con.prepareStatement(sql);
		ps.setString(1, email);
		ResultSet rs=ps.executeQuery();
		ps2=con.prepareStatement(sql1);
		ps2.setString(1, email);
		ResultSet rs1=ps2.executeQuery();
		boolean check =rs.next();
		boolean check1 =rs1.next();
		String u=rs1.getString("username");
	
	%>
	<nav class="nav-wrapper teal accent-4">
		<div>
			<a href="" class="sidenav-trigger show-on-large"
				data-target="mobile-menu"> <i class="material-icons">menu</i>
			</a>
			<ul class="sidenav" id="mobile-menu">
				<li><a href="" data-target="slide-out"><i
						class="material-icons right">close</i></a></li>
				<li><a href="javascript:void(0)">
							<b>Welcome <%=u%></b></a></li>
				<li><a href="Notebooks.jsp">Notebooks</a></li>
				<li><a href="dashboard.jsp">Notes</a></li>
				<li><a href="Edituser.jsp">Edit User</a></li>

			</ul>
			<ul class="right" id="rightside">
				<li><a href="Addnote.jsp"></a> <%if(!check){ %> <% 
                    }else{
                    	rs=ps.executeQuery();%> <%
        				while(rs.next()){
                    	String cDate=rs.getString("remainder");
						
						if(pDate.equals(cDate)){
							result=true;
                    %> <i class="fas fa-exclamation fa-sm"
					style="color: #eeeeee; position: absolute; z-index: 2; top: 10px; right: 130px;"></i>

					<%}}if(!result){%> <%}} %>
				<li id="noticlick" class="navicon"><a class="material-icons">notifications</a></li>
				<li><a href="LogoutServlet"><b>Logout</b></a></li>
			</ul>

		</div>
	</nav>
	<div id="notification" style="background: white">
		<ul id="alert">
			<%if(!check){ %>
			<li>&emsp;No notifications</li>
			<% 
                    }else{
                    	rs=ps.executeQuery();%>

			<%
        				while(rs.next()){
                    	String cDate=rs.getString("remainder");
						String name=rs.getString("notename");
						String des=rs.getString("des");
						if(pDate.equals(cDate)){
							result=true;
                    %>

			<ul class="collection grey lighten-4">
				<li style=""><%=name %>&nbsp;&nbsp;(<%=cDate %>)</li>

			</ul>
			<%}}if(!result){%>
			<li>&emsp;No notifications</li>
			<%}} %>
		</ul>
	</div>


	<h4 style="margin-left: 50px; font-size: 2vw">Your Daily Task!!!</h4>

	<%
    		if(!check){%>

	<%}
    		else{
				rs=ps.executeQuery();
				
			%>
	<div class="container-fluid">
		<div class="row">
			<div class="col s3 hide-on-small-only">
				<% while(rs.next()){
				String nName=rs.getString("notename");
				String cDate=rs.getString("remainder");
				String start= rs.getString("start");
				String end= rs.getString("end");
				
				%>
				<div class="left-content">
					<div class="card-title">
						<a class="teal-text"><b><%=nName%></b></a>
					</div>
					Start Date:
					<%=start%><br> End Date:
					<%=end%><br> <br>
				</div>
				<%} %>
			</div>

			<div class="col m9 s12">
				<% 
			rs=ps.executeQuery();
			while(rs.next()){
					String nName=rs.getString("notename");
					int nbid=rs.getInt("nbid");
					int id=rs.getInt("id");
					String start= rs.getString("start");
					String end= rs.getString("end");
					String status=rs.getString("status");
				    String des=rs.getString("des");%>
				<div class="right-content">
					<div class="container">


						<div class="col m11 s10 grey lighten-3">
							<div class="card ">
								<div class="card-content">
									<ul class="right">
										<li><a class="teal-text"
											href="EditNote.jsp?oldname=<%=nName%>&id=<%=id%>"><i
												class="fas fa-edit"></i>&nbsp;Edit</a></li>
										<li><a class="teal-text"
											href="DeleteNote?nName=<%=nName%>&id=<%=id %>&nbid=<%=nbid%>"><i
												class="fas fa-trash"></i>&nbsp;Delete</a></li>
									</ul>
									<div class="card-title">
										<a class="teal-text"><b><%=nName%></b></a>
									</div>
									Start Date:
									<%=start%>&nbsp;&nbsp;&nbsp;&nbsp;<a class="waves-effect waves-light btn"><%=status%></a>
									<br><br>End Date:
									<%=end%>
									<ul class="collapsible" >
									<li>
              <div class="collapsible-header">
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
				<%} %>
			</div>

		</div>
	</div>
	<%
       	}}
       catch(Exception e){
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
			$("#noticlick").click(function(){
                $("#notification").fadeToggle();
            });

		});
	</script>

</body>
</html>