package com;
import java.sql.*;
import java.util.Random;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/sign")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		
		String id=request.getParameter("id");
		String name=request.getParameter("Name");
		String password=request.getParameter("Password");
		String email=request.getParameter("e-Mail");
		String phone=request.getParameter("Phone_No");
		String Address=request.getParameter("Address");

		Random r=new Random();
		int a=r.nextInt();
		
		String s=String.valueOf(a);

		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore","root","root");
		PreparedStatement ps =con.prepareStatement("insert into Customer values (?,?,?,?,?,?)");
		ps.setString(1,s);
		ps.setString(2,name);
		ps.setString(3,phone);
		ps.setString(4,Address);
		ps.setString(5,email);
		ps.setString(6,password);
		int i=ps.executeUpdate();
		
		
		 
		if(i>0)
		{
			System.out.println("successfully registered");
			RequestDispatcher rd= request.getRequestDispatcher("login.jsp");
			rd.include(request, response);
		}
		else {
			System.out.println("something went wrong");
		}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
