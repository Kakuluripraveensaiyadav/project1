package delivery;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import java.sql.*;
@WebServlet("/reslogin")
public class ResLogin extends HttpServlet{

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
			request.getRequestDispatcher("ResLogin.jsp").forward(request,response);
		}
		try
		{
		PreparedStatement pst=con.prepareStatement("select username,pass from restaurantregistration where username=? and pass=?");
		pst.setString(1,uname);
		pst.setString(2, password);
		ResultSet rs=pst.executeQuery();
		while(rs.next())
		{
			request.setAttribute("successMessage","login successful");
         	request.getRequestDispatcher("ResLogin.jsp").forward(request,response);
			
		}
		request.setAttribute("errorMessage","Invalid Login Credentials");
		request.getRequestDispatcher("ResLogin.jsp").forward(request,response);
		
		}
		catch(Exception e)
		{
			System.out.print(e);
			request.setAttribute("errorMessage","Exception raised");
			request.getRequestDispatcher("ResLogin.jsp").forward(request,response);
			
		}
		
		
		
		
	}

}



