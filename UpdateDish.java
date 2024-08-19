package delivery;
import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLIntegrityConstraintViolationException;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
@WebServlet("/UpdateDish")

public class UpdateDish extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException
	{
		response.setContentType("text/html");
	
		
		Connection con=DBConnection.getCon();
		if(con==null)
		{
			System.out.println("inside if con check");
			request.setAttribute("errorMessage","DB Connection is null");
			request.getRequestDispatcher("RemoveDish.jsp").forward(request,response);
		} 
	
		String dishname=request.getParameter("dishSelect");
		String updatefield=request.getParameter("updateFieldSelect");
		String newValue;
		if(updatefield.equals("veg_or_nonveg"))
		{
			System.out.println("inside if");
		  newValue=request.getParameter("vegStatus");
		  System.out.println("new value= "+newValue);
		}
		else if(updatefield.equals("category"))
		{
			newValue=request.getParameter("categorySelect");
		}
		else
		{
			newValue=request.getParameter("newValue");
		}
		try
		{
			System.out.println("inside try");
			PreparedStatement pst=con.prepareStatement("update dishes set "+ updatefield+" = ?  where dishname=?");
			pst.setString(1,newValue);
			pst.setString(2, dishname);
			System.out.println(newValue+"  "+dishname);
			int row=pst.executeUpdate();
			System.out.println("query wxecuted");
			if(row>0)
			{
				request.setAttribute("successMessage", "data updated successfully");
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
			System.out.println("inside catch "+e);
			request.setAttribute("errorMessage","Exception raised");
			request.getRequestDispatcher("RestaurantPage.jsp").include(request, response);
		}

}
}
