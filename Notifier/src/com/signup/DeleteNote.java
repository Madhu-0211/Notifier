package com.signup;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DeleteNote
 */
@WebServlet("/DeleteNote")
public class DeleteNote extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteNote() {
		super();
		// TODO Auto-generated constructor stub
	}

	public static boolean valid_count(int id) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String url = "jdbc:mysql://localhost:3306/table1?allowPublicKeyRetrieval=true&useSSL=false";
		boolean check = false;
		String sql = "SELECT * FROM newnotebook WHERE id=?";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, "root", "examly");
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			check = rs.next();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String nName = request.getParameter("nName");
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		String id = request.getParameter("id");
		int id1 = Integer.parseInt(id);
		Connection con = null;
		PreparedStatement ps = null;
		String nbid = request.getParameter("nbid");
		int nbid1 = Integer.parseInt(nbid);
        
		String url = "jdbc:mysql://localhost:3306/table1?allowPublicKeyRetrieval=true&useSSL=false";
		String sql2 = "SELECT nname FROM addnote WHERE id=? AND email=?";
		String sql = "DELETE FROM addnote WHERE id=? AND email=? ";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, "root", "examly");
			ps = con.prepareStatement(sql2);
			ps.setInt(1, id1);
			ps.setString(2, email);
			ResultSet rs = ps.executeQuery();
			;
			if (rs.next()) {
				String notebookName = rs.getString("nname");
				ps = con.prepareStatement(sql);
				ps.setInt(1, id1);
				ps.setString(2, email);
				int row = ps.executeUpdate();
				int c = 0;
				boolean result = valid_count(nbid1);
				if (row > 0) {
					if (result) {
						sql = "SELECT COUNT(*) from addnote WHERE nbid=? AND email=?";
						ps = con.prepareStatement(sql);
						ps.setInt(1, nbid1);
						ps.setString(2, email);
						rs = ps.executeQuery();
						if (rs.next()) {
							c = Integer.parseInt(rs.getString(1));
							sql = "UPDATE newnotebook SET count=? WHERE id=? AND email=?";
							ps = con.prepareStatement(sql);
							ps.setInt(1, c);
							ps.setInt(2, nbid1);
							ps.setString(3, email);
							ps.executeUpdate();
						}
					}

					response.sendRedirect("dashboard.jsp");
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
