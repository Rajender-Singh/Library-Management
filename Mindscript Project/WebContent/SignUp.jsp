<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript" src="validation.js"></script>
<link rel="stylesheet" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sign Up</title>
<style>
body {
  background: #2d343d;
}

.login {
  margin: 20px auto;
  width: 300px;
  padding: 30px 25px;
  background: white;
  border: 10px solid #c4c4c4;
}

h1.login-title {
  margin: -28px -25px 25px;
  padding: 20px 25px;
  line-height: 30px;
  font-size: 25px;
 font-weight: 300;
  color: #ADADAD;
  text-align:center;
  background: #f7f7f7;
 
}

.login-input {
  width: 400px;
  height: 50px;
  margin-bottom: 25px;
  margin-left:16px;
  padding-left:10px;
  font-size: 15px;
  background: #fff;
  border: 1px solid #ccc;
  border-radius: 4px;
}
.login-input:focus {
    border-color:#6e8095;
    outline: none;
  }
.login-button {
  width: 400px; 
  height: 50px;
  margin-left:16px;
  padding: 0;
  font-size: 20px;
  color: #fff;
  text-align: center;
  background: #f0776c;
  border: 0;
  border-radius: 5px;
  cursor: pointer; 
  outline:0;
}
#wrap {
  border-radius:10px;
  width: 30%;
  margin: auto;
  background: #fff;
  overflow: hidden;
  padding: 15px;
  
}
</style>
</head>
<body style="text-align:center">

<form name="myform" action="sign" method="get" onsubmit="return validateform()">
<div id="wrap">
<h1 class="login-title">User Authentication</h1>
Name: <input type="text" class="login-input"   name="Name"><br>
EMail: <input type="text"class="login-input"  name="e-Mail"><br>
Password: <input type="password" class="login-input" name="Password"><br>
PhoneNumber: <input type="text"class="login-input"  name="Phone_No"><br>
Address: <input type="text"class="login-input"  name="Address"><br>
<input type="submit" value="Sign Up" class="login-button">
</div>

</form>
</body>
</html>