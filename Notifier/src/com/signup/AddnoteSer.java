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
 * Servlet implementation class AddnoteSer
 */
@WebServlet("/AddnoteSer")
public class AddnoteSer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddnoteSer() {
		super();
		// TODO Auto-generated constructor stub
	}

	public static boolean valid_count(String notename) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String url = "jdbc:mysql://localhost:3306/table1?allowPublicKeyRetrieval=true&useSSL=false";
		boolean check = false;
		String sql = "SELECT * FROM newnotebook WHERE nname=?";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, "root", "examly");
			ps = con.prepareStatement(sql);
			ps.setString(1, notename);
			rs = ps.executeQuery();
			check = rs.next();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "jdbc:mysql://localhost:3306/table1?allowPublicKeyRetrieval=true&useSSL=false";

		Connection con = null;
		String query = "INSERT INTO addnote(nbid,email,nname,notename,start,end,Remainder,Status,Tag,des) VALUES(?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = null;
		ResultSet rs = null;
		HttpSession session = request.getSession();
		String nbid = request.getParameter("nbid");
		String email = (String) session.getAttribute("email");
		String nname = request.getParameter("nname");
		String notename = request.getParameter("notename");
		String st = request.getParameter("start");
		String en = request.getParameter("end");
		String rem = request.getParameter("Remainder");
		String status = request.getParameter("Status");
		String tag = request.getParameter("Tag");
		String des = request.getParameter("des");

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, "root", "examly");
			ps = con.prepareStatement(query);
			ps.setString(1, nbid);
			ps.setString(2, email);
			ps.setString(3, nname);
			ps.setString(4, notename);
			ps.setString(5, st);
			ps.setString(6, en);
			ps.setString(7, rem);
			ps.setString(8, status);
			ps.setString(9, tag);
			ps.setString(10, des);
			int row = ps.executeUpdate();
			int c = 0;
			boolean result = valid_count(nname);
			if (row > 0) {
				if (result) {
					String sql = "SELECT COUNT(*) from addnote WHERE nname=? AND email=?";
					ps = con.prepareStatement(sql);
					ps.setString(1, nname);
					ps.setString(2, email);
					rs = ps.executeQuery();
					if (rs.next()) {
						c = Integer.parseInt(rs.getString(1));
						sql = "UPDATE newnotebook SET count=? WHERE nname=? AND email=?";
						ps = con.prepareStatement(sql);
						ps.setInt(1, c);
						ps.setString(2, nname);
						ps.setString(3, email);
						ps.executeUpdate();
					}
				}
				response.sendRedirect("dashboard.jsp");
			}

		} catch (Exception e) {
			System.out.println(e);
		}

	}
}
