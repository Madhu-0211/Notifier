package com.signup;

import java.io.IOException;
//import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.*;

/**
 * Servlet implementation class LoginSer
 */
@WebServlet("/LoginSer")
public class LoginSer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginSer() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");

		String password = request.getParameter("password");
		try {

			if (LoginDao.validate(email, password)) {
				HttpSession session = request.getSession();
				session.setAttribute("email", email);

				response.sendRedirect("dashboard.jsp");

			} else {
				//request.setAttribute("errorMessage","Invalid username or password");
				//RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
				//dispatcher.forward( request, response);
				
				response.sendRedirect("index.jsp?msg=not");
				
			}
		}

		catch (Exception e) {
			e.printStackTrace();
			
		}

	}

}
