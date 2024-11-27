package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ohrsDbUtil;


@WebServlet("/bookingDeleteServlet")
public class bookingDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			String bookID = request.getParameter("bookID");
			
			boolean isTrue;
			
			isTrue = ohrsDbUtil.deleteBooking(bookID);
			
			if(isTrue == true) {
				RequestDispatcher dis1 = request.getRequestDispatcher("success/bookingDeleteSuccess.jsp");
				dis1.forward(request, response);
			}else {
				RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
				dis2.forward(request, response);
			}
		}
		
		
	}


