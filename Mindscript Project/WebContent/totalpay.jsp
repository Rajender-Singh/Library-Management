<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TotalPay Page</title>
<style>
body{
background-image: url("images/4.jpg");
padding: 20px 20px ;
}
table,th,td {
border: 1px solid black;
padding: 5px;
font-size: x-large;
border-collapse: collapse;
}
tbody tr:nth-child(odd) {
background-color: #fbefcc;
}
tbody tr:nth-child(even) {
background-color: #cfe0e8;
}
a{
text-decoration: none;

}
.login-input{

width: 500px;
height: 60px;
margin-left: 30px;
padding: 5px;
font-size: 23px;
color: #fff;
text-align: left;
background: #f0776c;
border: 0;
border-radius: 5px;
border-color: black;
cursor: pointer;
outline: 0;
}
.login-output{

width: 500px;
height: 60px;
margin-left: 30px;
padding: 5px;
font-size: 23px;
color: #fff;
text-align: left;
background: #f0776c;
border: 0;
border-radius: 5px;
border-color: black;
cursor: pointer;
outline: 0;
}




</style>
</head>
<body>
<h2 style="text-align:center;">Your shopping cart</h2>

<%
String cname = (String)session.getAttribute("cname");
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore","root","root");
Statement statement = connection.createStatement() ;        
%>

 <%
		PreparedStatement ps2 = connection.prepareStatement("Select * from order_details where C_Name=?");
		 ps2.setString(1, cname);
		 ResultSet resultset = ps2.executeQuery();

		%> 
		 <TABLE style="width:100%">
            <TR>
                 <TH>ORDER ID</TH>
                <TH>CUST NAME</TH>
                <TH>ADDRESS</TH>
                <TH>PHONE</TH>
                <TH>BOOK ID</TH>
                <TH>QUANTITY</TH>
                <TH>TOTAL</TH>
                <TH>Date</TH>
         
            </TR>
            <% while(resultset.next()){ %>
            <TR>
            
                <TD> <%= resultset.getString(5) %></td>
                <TD> <%= resultset.getString(4) %></TD>
                <TD> <%= resultset.getString(7) %></TD>
                <TD> <%= resultset.getString(6) %></TD>
                <TD> <%= resultset.getString(1) %></TD>
                <TD> <%= resultset.getString(8) %></TD>
                <TD> <%= resultset.getString(10) %></TD>
                <TD> <%= resultset.getString(9) %></TD>
                
                
            </TR>
            <% } %>
        </TABLE>
		<br><br>
		
<a href="book.jsp" class="login-input">Add More Books</a><br><br>
<a href="success.jsp" class="login-output">Click to Confirm</a>

</body>
</html>