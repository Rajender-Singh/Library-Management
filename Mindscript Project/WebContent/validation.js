function validateform(){  
var name=document.myform.name.value;  
var password=document.myform.password.value;  
var x=document.myform.e-mail.value;
var atposition=x.indexOf("@");
var dotposition=x.lastIndexOf(".");
  
if (name==null||name==""){  
  alert("Name can't be blank");  
  
  return false;  
}else if(password.length<6){  
  alert("Password must be at least 6 characters long.");  
  return false;  
  }  
elseif(atposition<1 || dotposition<atposition+2 || dotposition+2>=x.length)
{
	alert("enter valid email id \n atposition:"+atposition+"\n dotposition:"+dotposition);
	return false;
}
}  