package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ohrsDbUtil;


@WebServlet("/hotelRegisterServlet")
public class hotelRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String hname = request.getParameter("hotelName");
		String hlocation = request.getParameter("hotelLocation");
		String contactNumber = request.getParameter("contactNumber");
		String hImage = request.getParameter("hImage");
		String managerUsername = request.getParameter("managerUsername");
		String managerPassword = request.getParameter("managerPassword");
		
		boolean isTrue = ohrsDbUtil.registerHotel(hname, hlocation, contactNumber, hImage, managerUsername, managerPassword);
		
		if(isTrue == true)
		{
			RequestDispatcher dis = request.getRequestDispatcher("success/hotelRegSuccess.jsp");
			dis.forward(request, response);
		}
		else
		{
			RequestDispatcher dis2 = request.getRequestDispatcher("success/hotelRegUnsuccess.jsp");
			dis2.forward(request, response);
		}
		
	}

}
