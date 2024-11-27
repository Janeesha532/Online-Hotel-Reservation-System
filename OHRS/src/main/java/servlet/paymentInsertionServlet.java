package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ohrsDbUtil;


@WebServlet("/paymentInsertionServlet")
public class paymentInsertionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String  cardtype = request.getParameter("cardtype");
		String cardnumber = request.getParameter("cardnumber");
		String  expirydate = request.getParameter("expirydate");
		String  cvc = request.getParameter("cvc");
		String  amount = request.getParameter("amount");
		
		
		boolean isTrue = ohrsDbUtil.insertPayment(name, email, cardtype, cardnumber, expirydate, cvc, amount, user_id);
		
		if(isTrue) {
			
			RequestDispatcher dis = request.getRequestDispatcher("success/paymentSuccess.jsp");
			dis.forward(request, response);
		}
		else
		{
			RequestDispatcher dis2 = request.getRequestDispatcher("success/unsuccess.jsp");
			dis2.forward(request, response);
		}
	}

}
