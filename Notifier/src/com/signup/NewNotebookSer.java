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
 * Servlet implementation class NewNotebookSer
 */
@WebServlet("/NewNotebookSer")
public class NewNotebookSer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NewNotebookSer() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "jdbc:mysql://localhost:3306/table1?allowPublicKeyRetrieval=true&useSSL=false";

		Connection con = null;
		String query = "INSERT INTO newnotebook(email,nname) VALUES(?,?)";
		PreparedStatement ps = null;
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		String nname = request.getParameter("nname");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, "root", "examly");
			ps = con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, nname);
			int row = ps.executeUpdate();
			if (row > 0) {
				response.sendRedirect("Notebooks.jsp");
			}

		} catch (Exception e) {
			System.out.println(e);
		}

	}

}
