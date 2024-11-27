package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ohrsDbUtil;

@WebServlet("/updateUserDetails")
public class updateUserDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String user_id = request.getParameter("user_id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String contactNum = request.getParameter("contactNum");
		String dob = request.getParameter("dob");
		String password = request.getParameter("password");
		
		boolean isTrue = ohrsDbUtil.updateUserDetails(user_id, name, email, address, contactNum, dob, password);
		
		if(isTrue == true)
		{
			RequestDispatcher dis = request.getRequestDispatcher("success/userUpdateSuccess.jsp");
			dis.forward(request, response);
		}
		else
		{
			RequestDispatcher dis2 = request.getRequestDispatcher("success/userUpdateUnsuccess.jsp");
			dis2.forward(request, response);
		}
		
		
	}

}
