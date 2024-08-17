package delivery;

import java.sql.Connection;
import java.sql.DriverManager;
public class DBConnection {
	static Connection con;
	public static  Connection getCon()
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodsphere","root","Praveen@2004");
			return con;
			
		}
		catch(Exception e)
		{
	       return null;
		}
		
		
	}

}
