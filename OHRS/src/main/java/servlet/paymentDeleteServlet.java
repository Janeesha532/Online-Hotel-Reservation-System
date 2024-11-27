package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ohrsDbUtil;

/**
 * Servlet implementation class paymentDeleteServlet
 */
@WebServlet("/paymentDeleteServlet")
public class paymentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
			int  id = Integer.parseInt(request.getParameter("paymentId"));
					
					boolean isTrue=ohrsDbUtil.paymentDelete(id);
					
					if (isTrue) {
						RequestDispatcher dispatcher = request.getRequestDispatcher("success/paymentDeleteSuccess.jsp");
						dispatcher.forward(request, response);
					} else {
						RequestDispatcher dispatcher = request.getRequestDispatcher("success/paymentDeleteUnsuccess.jsp");
						dispatcher.forward(request, response);
					}	
					
	}
	}


