package com.signup;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SignupServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String no = request.getParameter("number");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String conform = request.getParameter("conform");
		String url = "jdbc:mysql://localhost:3306/table1?allowPublicKeyRetrieval=true&useSSL=false";
		String query = "INSERT INTO signup (username,number,email,password,conform) VALUES (?,?,?,?,?)";
		Connection con = null;

		try {

			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, "root", "examly");
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, no);
			ps.setString(3, email);
			ps.setString(4, password);
			ps.setString(5, conform);
			int n = ps.executeUpdate();
			if (n > 0) {
				response.sendRedirect("index.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
