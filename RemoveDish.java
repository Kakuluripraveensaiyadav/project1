package delivery;
import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLIntegrityConstraintViolationException;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
@WebServlet("/RemoveDish")
public class RemoveDish extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException
	{
		response.setContentType("text/html");
		String dishname=request.getParameter("dishname");
		Connection con=DBConnection.getCon();
		
	
	if(con==null)
	{
		System.out.println("inside if con check");
		request.setAttribute("errorMessage","DB Connection is null");
		request.getRequestDispatcher("RemoveDish.jsp").forward(request,response);
	} 
	try
	{
		System.out.println("inside try");
		PreparedStatement pst=con.prepareStatement("delete from dishes where dishname=?");
		pst.setString(1, dishname);
		int count=pst.executeUpdate();
		if(count>0)
		{
			System.out.println("inside if");
			request.setAttribute("successMessage", "dish removed successfully");
			request.getRequestDispatcher("RestaurantPage.jsp").include(request, response);
		}
		else
		{
			System.out.println("else");
			request.setAttribute("errorMessage","SQL Exception raised");
			request.getRequestDispatcher("RestaurantPage.jsp").include(request, response);
		}
	}
	catch(Exception e)
	{
		System.out.println("inside catch"+e);
		request.setAttribute("errorMessage","Exception raised");
		request.getRequestDispatcher("RestaurantPage.jsp").include(request, response);
	}

	}
}
