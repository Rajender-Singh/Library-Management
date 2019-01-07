<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart Lists</title>
</head>
<body>


<h2>Cart List</h2>
<%
	String bid = request.getParameter("bid");
	String total = request.getParameter("total");
	String bkprice = request.getParameter("bkprice");
	String quantity = request.getParameter("quan1");
	String bkname = (String)session.getAttribute("bkname");
	String email = (String)session.getAttribute("email");
	//int rid = (int)session.getAttribute("rid");
	
	java.util.Date date = new java.util.Date();
	Date sqldate = new java.sql.Date(date.getTime());
	
	
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore","root","root");
            Statement statement = connection.createStatement() ;        
            
            
            PreparedStatement ps = connection.prepareStatement("Select * from Customer where C_Email=?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            rs.next();
            	
             
           PreparedStatement ps1 = connection.prepareStatement("insert into order_details (B_id,C_id,C_Name,Phone_No,Address,Order_Date,Quantity,B_Name,Total_Pay) values(?,?,?,?,?,?,?,?,?)");
            ps1.setString(1, bid);
            ps1.setInt(2, rs.getInt(1));
            ps1.setString(3, rs.getString(2));
            ps1.setString(4, rs.getString(3));
            ps1.setString(5, rs.getString(4));
            ps1.setDate(6, sqldate);
            ps1.setString(7, quantity);
            ps1.setString(8, bkname);
            ps1.setString(9, total);
            
         	
            int x=ps1.executeUpdate();
            
            if(x>0)
            {
            	out.println("Book Added to Cart");
            	response.sendRedirect("totalpay.jsp");
            }
            else
            {
            	out.write("Something Went Wrong");
            }  
            
 				String cname = rs.getString(2);
 				session.setAttribute("cname", cname);
            
            
%>
</body>
</html>