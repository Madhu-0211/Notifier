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
 * Servlet implementation class EditNotes
 */
@WebServlet("/EditNotes")
public class EditNotes extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditNotes() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String nName = request.getParameter("newname");
		String s=request.getParameter("start");
		String en = request.getParameter("end");
		String rem = request.getParameter("Remainder");
		String des = request.getParameter("des");

		String id = request.getParameter("id");
		int id1 = Integer.parseInt(id);
		Connection con = null;
		PreparedStatement ps = null;
		String url = "jdbc:mysql://localhost:3306/table1?allowPublicKeyRetrieval=true&useSSL=false";
		String sql = "UPDATE addnote SET notename=?,start=?,end=?,Remainder=?,des=? WHERE id=?";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, "root", "examly");
			ps = con.prepareStatement(sql);
			ps.setString(1, nName);
			ps.setString(2, s);
			ps.setString(3, en);
			ps.setString(4, rem);
			ps.setString(5, des);
			ps.setInt(6, id1);

			int row = ps.executeUpdate();
			if (row > 0) {

				response.sendRedirect("dashboard.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

}
