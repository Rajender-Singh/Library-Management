<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
  margin-left:30px;
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
  margin-left:27px;
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
.login-lost
{
  text-align:center;
  margin-bottom:0px;
}

.login-lost a
{
  color:#666;
  text-decoration:none;
  font-size:16px;
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
</head>
<body>

<form action="login">
<div id="wrap">
<h1 class="login-title">User Authentication</h1>
<input type="text" class="login-input" placeholder="Email Address" autofocus name="email"><br>
<input type="password" class="login-input" placeholder="Password" name="password"><br>
<input type="submit" value="Login" class="login-button">
<p class="login-lost"><a href="">Forgot Password ?</a></p>
</div>
</form>
</body>
</html>