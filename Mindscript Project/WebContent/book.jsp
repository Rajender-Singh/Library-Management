<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
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
width: 200px;
height: 20px;
margin-bottom: 25px;
padding-left: 10px;
font-size: 15px;
background: inherit;
border: 1px solid white;
border-radius: 4px; 
}

.login-input:focus{
border-color: #6e8095;
outline: none; 
}
.login-button {
width: 400px;
height: 50px;
margin-left: 27px;
padding: 0;
font-size: 20px;
color: #fff;
text-align: center;
background: #f0776c;
border: 0;
border-radius: 5px;
border-color: white;
cursor: pointer;
outline: 0;
} 
#wrap{
border-radius: 10px;
width: 30%;
margin: auto;
/*background: #fff;*/
overflow: hidden;
padding: 15px;
 


}


</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book List</title>
</head>
<body>

<h2 style="text-align:center;"> Welcome User !!!!</h2>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore","root","root");
PreparedStatement ps=con.prepareStatement("select * from book ");
ResultSet rs=ps.executeQuery();

String Book_Id;
String Book_Name;
String Book_Author;
String Book_Price;

%>
<table style="width:100%">
<tr>
	<th>BookID</th>
	<th>BookName</th>
	<th>Author</th>
	<th>Price</th>
	
</tr>

<%
while(rs.next())
{
	Book_Id=rs.getString(1);
	Book_Name=rs.getString(2);
	Book_Author=rs.getString(3);
	Book_Price=rs.getString(4);
%>	

	<tr>
		<td><%=Book_Id %></td>
		<td><%=Book_Name %></td>
		<td><%=Book_Author %></td>
		<td><%=Book_Price %></td>
		
<% } %>
</tr>
</table>
<div id="wrap">
 <form action="Quantity.jsp">
        
   	  <h2>Select Quantity: <input type="text" class="login-input" autofocus name="quan"></h2>
      <h2>Book Id: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="text" class="login-input" name="bkid"></h2>
      <input type="submit" value="Check" class="login-button">
        </form>
</div>	
</body>
</html>