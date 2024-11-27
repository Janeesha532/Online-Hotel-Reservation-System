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
 * Servlet implementation class InsertServlet
 */
@WebServlet("/insertServlet")
public class insertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String hotelId = request.getParameter("hotelId");
		String RoomType = request.getParameter("RoomType");
		String FullBoardRate = request.getParameter("FullBoardRate");
		String HalfBoardRate = request.getParameter("HalfBoardRate");
		String facilities = request.getParameter("facilities");
		String RoomImage = request.getParameter("RoomImage");
		
		boolean isTrue = ohrsDbUtil.InsertRoom(RoomType, FullBoardRate, HalfBoardRate, facilities, RoomImage, hotelId);
		
		if(isTrue == true)
		{
			RequestDispatcher dis = request.getRequestDispatcher("success/success.jsp");
			dis.forward(request, response);
		}
		else
		{
			RequestDispatcher dis2 = request.getRequestDispatcher("success/unsuccess.jsp");
			dis2.forward(request, response);
		}
		
	}

}
