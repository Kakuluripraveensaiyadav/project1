package delivery;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import java.sql.*;
@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
	{
		String uname=request.getParameter("username");
		String password=request.getParameter("password");
		Connection con=DBConnection.getCon();
		if(con==null)
		{
			request.setAttribute("errorMessage","DB Connection is null");
			request.getRequestDispatcher("UserLogin.jsp").forward(request,response);
		}
		try
		{
		PreparedStatement pst=con.prepareStatement("select username,password from userregistration where username=? and password=?");
		pst.setString(1,uname);
		pst.setString(2, password);
		ResultSet rs=pst.executeQuery();
		while(rs.next())
		{
			request.setAttribute("successMessage","login successful");
         	request.getRequestDispatcher("UserLogin.jsp").forward(request,response);
			
		}
		request.setAttribute("errorMessage","Invalid Login Credentials");
		request.getRequestDispatcher("UserLogin.jsp").forward(request,response);
		
		}
		catch(Exception e)
		{
			System.out.print(e);
			request.setAttribute("errorMessage","Exception raised");
			request.getRequestDispatcher("UserLogin.jsp").forward(request,response);
			
		}
		
		
		
		
	}

}
