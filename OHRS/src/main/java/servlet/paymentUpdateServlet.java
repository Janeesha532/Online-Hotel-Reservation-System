package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ohrsDbUtil;


@WebServlet("/paymentUpdateServlet")
public class paymentUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int  paymentId = Integer.parseInt(request.getParameter("paymentId"));
		int user_id = Integer.parseInt(request.getParameter("userId"));
		String fname = request.getParameter("name");
		String email = request.getParameter("email");
		String ctype = request.getParameter("cardtype");
		String cnumber = request.getParameter("cardnumber");
		String exdate = request.getParameter("expirydate");
		String cvc = request.getParameter("cvc");
		String tamount = request.getParameter("amount");
		
		boolean isTrue = ohrsDbUtil.updatePayment(paymentId, fname, email, ctype, cnumber, exdate, exdate, tamount, user_id);

		if (isTrue) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("success/paymentUpdateSuccess.jsp");
			dispatcher.forward(request, response);
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("success/paymentUpdateUnsuccess.jsp");
			dispatcher.forward(request, response);
		}	
		
	}
		
		
		
	}


