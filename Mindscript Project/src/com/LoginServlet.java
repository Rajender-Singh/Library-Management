package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out=response.getWriter();
		HttpSession s=request.getSession();
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		int id;
		
		//s.setAttribute("email", email);
		
		if(validate.checkuser(email,password))
		{
			//Random rd=new Random();
			id=validate.id;
			s.setAttribute("rid",id);
			s.setAttribute("email",email);
			System.out.println("successfully login");;
			RequestDispatcher rs=request.getRequestDispatcher("book.jsp");
			rs.include(request, response);
	
		}
		else {
			out.println("<h3 style='color:white'> Username or Password is incorrect");
			RequestDispatcher rs=request.getRequestDispatcher("login.jsp");
			rs.include(request, response);
		}
		
	}

}
