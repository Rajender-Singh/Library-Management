package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class validate {
		static int id;
	public static boolean checkuser(String email, String pass) {
		boolean st=false;
		try {
		
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore","root","root");
			PreparedStatement ps =con.prepareStatement("select * from customer where C_Email= ? and C_Password= ?");
			ps.setString(1,email);
			ps.setString(2,pass);
			ResultSet rs=ps.executeQuery();
			st=rs.next();
			System.out.println(st);
			id = rs.getInt(1);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return st;
}
}
