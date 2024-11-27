package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ohrsDbUtil;


@WebServlet("/deleteUserServlet")
public class deleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		String user_id = request.getParameter("roomId");
		
		boolean isTrue = ohrsDbUtil.deleteUserAccount(user_id);
		
		if(isTrue == true)
		{
			request.setAttribute("statusMessage", "Room deleted successfully");
			RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
			dis.forward(request, response);
		}
		else
		{
			 request.setAttribute("statusMessage", "Room deletion failed.");
				RequestDispatcher dis2 = request.getRequestDispatcher("success/userDeleteUnsuccess.jsp");
				dis2.forward(request, response);
		}
	}

}
