package servlet;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ohrsDbUtil;



@WebServlet("/bookingServlet")
public class bookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int roomId = Integer.parseInt(request.getParameter("roomId"));
		 String userId = request.getParameter("userId");
		 //String bookId = request.getParameter("bookId");
		 String name = request.getParameter("name");
		 String email = request.getParameter("email");
		 String checkin = request.getParameter("checkin");
		 String checkout = request.getParameter("checkout");
		 String roomtype = request.getParameter("roomtype");
		 String guests = request.getParameter("guests");
		 String board = request.getParameter("board");
		 String note = request.getParameter("note");
		 String contact = request.getParameter("contact");
		 String payment = request.getParameter("payment");
		 
		boolean isTrue = ohrsDbUtil.bookingInsertion(name, email, checkin, checkout , roomtype, guests, board, note, contact, payment, roomId, userId);
		 
		 if(isTrue == true){
			 
			 RequestDispatcher dis = request.getRequestDispatcher("bookingSuccess.jsp");
			 dis.forward(request, response);
		 }else {
			 RequestDispatcher dis2 = request.getRequestDispatcher("success/unsuccess.jsp");
			 dis2.forward(request, response);
		 }
		 
	}
	}


