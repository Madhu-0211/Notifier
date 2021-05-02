package com.signup;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class EditUser
 */
@WebServlet("/EditUser")
public class EditUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement ps = null;
		String username = request.getParameter("username");
		String number = request.getParameter("number");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		String url = "jdbc:mysql://localhost:3306/table1?allowPublicKeyRetrieval=true&useSSL=false";
		HttpSession session = request.getSession();
		String em = (String) session.getAttribute("email");
		String sql = "UPDATE signup SET username=?,number=?,email=?,password=?,conform=? WHERE email=?";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, "root", "examly");
			ps = con.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, number);
			ps.setString(3, email);
			ps.setString(4, password);
			ps.setString(5, password);
			ps.setString(6, em);
			int row = ps.executeUpdate();
			if (row > 0) {
				response.sendRedirect("dashboard.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
