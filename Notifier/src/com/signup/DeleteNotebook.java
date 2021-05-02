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

/**
 * Servlet implementation class DeleteNotebook
 */
@WebServlet("/DeleteNotebook")
public class DeleteNotebook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteNotebook() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String nName = request.getParameter("nName");
		String id = request.getParameter("id");
		int id1 = Integer.parseInt(id);
		Connection con = null;
		PreparedStatement ps = null;
		String url = "jdbc:mysql://localhost:3306/table1?allowPublicKeyRetrieval=true&useSSL=false";
		String sql = "DELETE FROM newnotebook WHERE id=?";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, "root", "examly");
			ps = con.prepareStatement(sql);
			ps.setInt(1, id1);
			int row = ps.executeUpdate();
			if (row > 0) {
				sql = "DELETE FROM addnote WHERE nbid=?";
				ps = con.prepareStatement(sql);
				ps.setInt(1, id1);
				ps.executeUpdate();
				response.sendRedirect("Notebooks.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
