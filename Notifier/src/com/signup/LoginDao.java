package com.signup;

import java.sql.*;

//import java.util.*;
public class LoginDao {
	public static boolean validate(String email, String password) throws SQLException, ClassNotFoundException {
		boolean s = false;
		try {
			String url = "jdbc:mysql://localhost:3306/table1?allowPublicKeyRetrieval=true&useSSL=false";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, "root", "examly");
			String query = "Select * from signup where email=? and password=?";

			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet r = ps.executeQuery();
			s = r.next();
		} catch (Exception e) {
			System.out.print(e);
		}
		return s;
	}
}
