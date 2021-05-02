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
 * Servlet implementation class EditNotebook
 */
@WebServlet("/EditNotebook")
public class EditNotebook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditNotebook() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String nName = request.getParameter("newname");
		String id = request.getParameter("id");
		int id1 = Integer.parseInt(id);
		Connection con = null;
		PreparedStatement ps = null;

		String url = "jdbc:mysql://localhost:3306/table1?allowPublicKeyRetrieval=true&useSSL=false";
		String sql = "UPDATE newnotebook SET nname=? WHERE id=?";
		String sql1 = "UPDATE addnote SET nname=? WHERE nbid=?";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, "root", "examly");
			ps = con.prepareStatement(sql);
			ps.setString(1, nName);
			ps.setInt(2, id1);
			int row = ps.executeUpdate();
			if (row > 0) {
				ps = con.prepareStatement(sql1);
				ps.setString(1, nName);
				ps.setInt(2, id1);
				int row1 = ps.executeUpdate();
				response.sendRedirect("Notebooks.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
