package servlet;

import java.io.IOException;
//import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.ohrsDbUtil;
import model.Hotel;
import model.user;


@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		response.setContentType("text/html");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		boolean isTrueM = ohrsDbUtil.validateAdmin(username, password);
		boolean isTrueU = ohrsDbUtil.validateUser(username, password);
		
		if (isTrueM == true)
		{
			HttpSession session = request.getSession();
            
            // Set user details in the session
            session.setAttribute("username", username);
            
            
            // Redirect to a welcome page
            response.sendRedirect("RoomInsert.jsp");
			
			List<Hotel> hotelD = ohrsDbUtil.getHotelDetails(username);
			request.setAttribute("hotelD", hotelD);
			
			//RequestDispatcher dis = request.getRequestDispatcher("RoomInsert.jsp");
			//dis.forward(request, response);

			
		}
		else if(isTrueU == true)
		{
			HttpSession session = request.getSession();
            
            // Set user details in the session
            session.setAttribute("username", username);
            
            
            // Redirect to a welcome page
            response.sendRedirect("homePage.jsp");
			
			List<user> userD = ohrsDbUtil.getUserDetails(username);
			request.setAttribute("userD", userD);
			
			//RequestDispatcher dis1 = request.getRequestDispatcher("user.jsp");
			//dis1.forward(request, response);

			
		}
		else 
		{
			RequestDispatcher dis2 = request.getRequestDispatcher("success/loginUnsuccess.jsp");
			dis2.forward(request, response);
		
			}


	}
}	
