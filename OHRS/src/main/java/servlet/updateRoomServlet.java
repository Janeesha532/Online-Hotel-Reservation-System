package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ohrsDbUtil;


@WebServlet("/updateRoomServlet")
public class updateRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String roomid = request.getParameter("roomid");
		String RoomType = request.getParameter("RoomType");
		String FullBoardRated = request.getParameter("FullBoardRate");
		String HalfBoardRate = request.getParameter("HalfBoardRate");
		String Facilities = request.getParameter("Facilities");
		String RoomImage = request.getParameter("RoomImage");
		
		boolean isTrue = ohrsDbUtil.updateRoomDetails(roomid, RoomType, FullBoardRated, HalfBoardRate, Facilities, RoomImage);
		
		if(isTrue == true)
		{
			RequestDispatcher dis = request.getRequestDispatcher("success/updateSuccess.jsp");
			dis.forward(request, response);
		}
		else
		{
			RequestDispatcher dis2 = request.getRequestDispatcher("success/updateUnsuccess.jsp");
			dis2.forward(request, response);
		}
		
		
	}

}
