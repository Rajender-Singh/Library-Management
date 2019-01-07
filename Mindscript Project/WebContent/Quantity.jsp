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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Quantity Cart Page</title>
<style>
body{
background-image: url("images/4.jpg"); 
}
table{
border: 1px solid black;
padding: 5px;
font-size: x-large;
border-collapse: collapse;
}
a{
text-decoration: none;
font-weight: bold;
font-size: 35px;

}
span{

padding-left: 20px;

}

</style>
</head>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<body >
<h1 style="text-align:center;"> Your Cart</h1>
 <% 
            Connection connection = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/bookstore","root","root");

            Statement statement = connection.createStatement() ;
            
            PreparedStatement ps = connection.prepareStatement("Select * from book where B_Id=?");
            String bid = request.getParameter("bkid");
            String quan1 = request.getParameter("quan");
            ps.setString(1, bid);
            ResultSet resultset =ps.executeQuery();
            int quan = Integer.parseInt(quan1.toString());
            int bkprice;
            int total;
            String bkname = "";
          
        %>
        
          <TABLE style="width:100%">
            <TR>
                <TH>BOOK ID</TH>
                <TH>BOOK NAME</TH>
                <TH>AUTHOR</TH>
                <TH>PRICE</TH>
                <TH>Quantity</TH>
                <TH>Total</TH>
                
             
            </TR>
            <% while(resultset.next()){ %>
            <TR>
            	
                <TD> <%= resultset.getString(1) %></td>
                <TD> <%= bkname=resultset.getString(2) %></TD>
                <TD> <%= resultset.getString(3) %></TD>
                <TD> <%= bkprice=resultset.getInt(4) %></TD>
                <TD><%=  quan1 %></TD>
                <TD><%= total=bkprice*quan%></TD>
                </TR>
            	
           
        </TABLE> 
 	<% 
 	 HttpSession s = request.getSession();
    s.setAttribute("bid", bid);
    s.setAttribute("quan1", quan1);
    s.setAttribute("bkname",bkname);
    
    
 	%>
 	<br><br>
 	
 	<a href="Quantity1.jsp?bkprice=<%=resultset.getInt(4)%>&total=<%=resultset.getInt(4)*quan%>&bid=<%=bid%>&quan1=<%=quan1%>">
 	<class="btn btn-info btn-lg">
    <span class="glyphicon glyphicon-shopping-cart"></span>Add to Cart
        </a>
        <% } %>


</body>
</html>