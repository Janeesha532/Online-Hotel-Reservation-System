package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ohrsDbUtil;
//import model.Room;
import model.RoomList;


@WebServlet("/roomRetriveServlet")
public class roomRetriveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String location = request.getParameter("location");
		String checkIn = request.getParameter("check-in");
		String checkOut = request.getParameter("check-out");
		String RoomType = request.getParameter("RoomType");
		
		List<RoomList> roomL = ohrsDbUtil.roomSearch(location, checkIn, checkOut, RoomType);
		
		
		
			request.setAttribute("roomL", roomL);
			
			RequestDispatcher dis = request.getRequestDispatcher("roomDetailsShow.jsp");
			
			dis.forward(request, response);
			
		


		
	}

}
