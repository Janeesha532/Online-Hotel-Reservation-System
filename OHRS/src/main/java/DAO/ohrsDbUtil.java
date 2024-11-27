package DAO;

import java.sql.Connection;
//import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
//import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import DB.DBConnect;
import model.Customer;
import model.Hotel;
import model.Payment;
import model.Room;
import model.RoomList;
import model.user;

public class ohrsDbUtil {
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;

	public static boolean InsertRoom( String RoomType, String FullBoardRate, String HalfBoardRate, String facilities, String RoomImage, String hotelId )
	{
		boolean isSuccess = false;
		
		//crate database connection 

		
		try {
			
	        con = DBConnect.getConnection();
	        stmt = con.createStatement();
	        
			String sql = "INSERT INTO room_details VALUES(0, '"+RoomType+"', '"+FullBoardRate+"', '"+HalfBoardRate+"', '"+facilities+"', '"+RoomImage+"', '"+hotelId+"')";
			int rs = stmt.executeUpdate(sql);
			
			if(rs>0)
			{
				isSuccess = true;
			}
			else
			{
				isSuccess = false; 
			}
			
		}
		catch(Exception e){
			
			e.printStackTrace();
		}
		
		
		return isSuccess;
	}
	
	public static List<Room> getAllRooms(int hotelId)
	{
		List<Room> rooms = new ArrayList<>();
		
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "SELECT * FROM room_details WHERE hotelId = '"+hotelId+"' ";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int roomId = rs.getInt("roomId");
				String RoomType = rs.getString("RoomType");
				String FullBoardRate = rs.getString("FullBoardRate");
				String HalfBoardRate = rs.getString("HalfBoardRate");
				String facilities = rs.getString("facilities");
				String RoomImage = rs.getString("RoomImage");
				
				Room R1 = new Room(roomId, RoomType, FullBoardRate, HalfBoardRate, facilities, RoomImage);
				
				rooms.add(R1);
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
		finally {
			
			try {
				if(rs != null)rs.close();
				if(rs != null)stmt.close();
				if(rs != null)con.close();
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}
		
		
		return rooms;
		
	}
	
	public static boolean updateRoomDetails(String roomid, String RoomType, String FullBoardRated, String HalfBoardRate, String Facilities, String RoomImage )
	{
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "UPDATE room_details SET RoomType = '"+RoomType+"' , FullBoardRate = '"+FullBoardRated+"', HalfBoardRate = '"+HalfBoardRate+"', Facilities = '"+Facilities+"', RoomImage = '"+RoomImage+"'  WHERE roomId = '"+roomid+"'";
			
			int rs = stmt.executeUpdate(sql);
			
			if(rs>0)
			{
				isSuccess = true;
			}
			else
			{
				isSuccess = false; 
			}
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return isSuccess;
		
	}
	
	public static boolean updateUserDetails(String user_id, String name, String email, String address, String contactNum, String dob, String password )
	{
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "UPDATE user_details SET  name = '"+name+"', email = '"+email+"', address = '"+address+"', contactNum = '"+contactNum+"', dob = '"+dob+"', password = '"+password+"'  WHERE user_id = '"+user_id+"'";
			
			int rs = stmt.executeUpdate(sql);
			
			if(rs>0)
			{
				isSuccess = true;
			}
			else
			{
				isSuccess = false; 
			}
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return isSuccess;
		
	}
	
	public static boolean deleteRoomDetails(String roomid)
	{
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "DELETE FROM ohrs.room_details WHERE roomId ='"+roomid+"'";
			
			int rs = stmt.executeUpdate(sql);
			
			if(rs>0)
			{
				isSuccess = true;
			}
			else
			{
				isSuccess = false; 
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
public static boolean deleteUserAccount(String user_id) {
	try {
		
		con = DBConnect.getConnection();
		stmt = con.createStatement();
		
		String sql = "DELETE FROM ohrs.user_details WHERE user_id ='"+user_id+"'";
		
		int rs = stmt.executeUpdate(sql);
		
		if(rs>0)
		{
			isSuccess = true;
		}
		else
		{
			isSuccess = false; 
		}
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
	return isSuccess;
	}

	
	public static boolean registerHotel(String hname, String hlocation, String contactNumber, String hImage, String managerUsername, String managerPassword)
	{
		
		try {
			
		        con = DBConnect.getConnection();
		        stmt = con.createStatement();
		        
				String sql = "INSERT INTO hotel_details VALUES(0, '"+hname+"', '"+hlocation+"', '"+contactNumber+"', '"+hImage+"', '"+managerUsername+"', '"+managerPassword+"')";
				int rs = stmt.executeUpdate(sql);
				
				if(rs>0)
				{
					isSuccess = true;
				}
				else
				{
					isSuccess = false; 
				}
			
		}
		catch(Exception e){
			
				e.printStackTrace();
		}
		
		
		return isSuccess;
	}
	
	public static List<Hotel> getHotelDetails(String username)
	{
		ArrayList<Hotel> hotel = new ArrayList<>();
		
			try {
			
	        		con = DBConnect.getConnection();
			        stmt = con.createStatement();
			        
					String sql = "SELECT * FROM hotel_details WHERE managerUsername = '"+username+"'";
					rs = stmt.executeQuery(sql);
					
					while(rs.next())
					{
						int hotelId = rs.getInt("hotelId");
						String hotelName = rs.getString("hotelName");
						String hotelLocation = rs.getString("hotelLocation");
						String contactNumber = rs.getString("contactNumber");
						String hotelImage = rs.getString("hotelImage");
						String managerUsername = rs.getString("managerUsername");
						String managerPassword = rs.getString("managerPassword");
						
						Hotel h = new Hotel(hotelId, hotelName, hotelLocation, contactNumber, hotelImage, managerUsername, managerPassword  );
						hotel.add(h);
						
					}
		
			}
			catch(Exception e){
				
					e.printStackTrace();
			}
		
		
		return hotel;
		
	}
	
	public static List<user> getUserDetails(String username)
	{
		ArrayList<user> user = new ArrayList<>();
		
			try {
			
	        		con = DBConnect.getConnection();
			        stmt = con.createStatement();
			        
					String sql = "SELECT * FROM user_details WHERE email = '"+username+"'";
					rs = stmt.executeQuery(sql);
					
					while(rs.next())
					{
						int user_id = rs.getInt("user_id");
						String name = rs.getString("name");
						String email = rs.getString("email");
						String address = rs.getString("address");
						String contactNum = rs.getString("contactNum");
						String dob = rs.getString("dob");
						String password = rs.getString("password");
						
						user u = new user(user_id, name, email, address, contactNum, dob, password);
						user.add(u);
						
					}
		
			}
			catch(Exception e){
				
					e.printStackTrace();
			}
		
		
		return user;
		
	}
	


	public static boolean validateAdmin(String username, String password)
	{
		
		
		try {

    		con = DBConnect.getConnection();
	        stmt = con.createStatement();
	        
			String sql = "SELECT * FROM hotel_details WHERE managerUsername = '"+username+"' AND managerPassword = '"+password+"'";
		
			
			rs = stmt.executeQuery(sql);
			
			if(rs.next())
			{
				isSuccess = true;
			
			}
			else
			{
				isSuccess = false; 
			
			}
			
		}
		catch(Exception e) {
			
			e.printStackTrace();
		}
		return isSuccess;
		
		
		
		
	}
	
	public static boolean validateUser(String username, String password)
	{
		
		
		try {

    		con = DBConnect.getConnection();
	        stmt = con.createStatement();
	        
			String sql = "SELECT * FROM user_details WHERE email = '"+username+"' AND password = '"+password+"'";
		
			
			rs = stmt.executeQuery(sql);
			
			if(rs.next())
			{
				isSuccess = true;
			
			}
			else
			{
				isSuccess = false; 
			
			}
			
		}
		catch(Exception e) {
			
			e.printStackTrace();
		}
		return isSuccess;
		
		
		
		
	}
	
	public static boolean userRegister(String name, String email, String address, String contactnumber, String birthdate, String password) {
		boolean isSuccess = false;
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "INSERT INTO user_details VALUES (0, '"+name+"', '"+email+"', '"+address+"', '"+contactnumber+"', '"+birthdate+"', '"+password+"')";
			int rs = stmt.executeUpdate(sql);
			
			if(rs>0) {
				isSuccess = true;
			}
			
			else {
				isSuccess = false;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return isSuccess;
		
	}

	public static List<RoomList> roomSearch(String location, String checkIn, String checkOut, String roomType) {
	
		
		ArrayList<RoomList> RL = new ArrayList<>();
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "SELECT hd.hotelId, rd.roomId, bd.id,  hd.hotelName, hd.hotelLocation, rd.RoomType, rd.RoomImage, hd.contactNumber, rd.facilities, rd.FullBoardRate, rd.HalfBoardRate FROM hotel_details hd JOIN room_details rd ON hd.hotelId = rd.hotelId LEFT JOIN booking_details bd ON rd.RoomId = bd.RoomId "
					+ "WHERE hd.hotelLocation LIKE '%"+location+"%'  AND rd.RoomType = '"+roomType+"'  AND ( bd.RoomId IS NULL OR( '"+checkIn+"' NOT BETWEEN bd.checkin AND bd.checkout AND '"+checkOut+"' NOT BETWEEN bd.checkin AND bd.checkout AND bd.checkin NOT BETWEEN '"+checkIn+"' AND '"+checkOut+"' AND bd.checkout NOT BETWEEN '"+checkIn+"' AND '"+checkOut+"'))"; //Ensuring entered dates do not overlap with existing bookings
			
				rs = stmt.executeQuery(sql);
				
				String checkOut1 = checkOut;
				String checkIn1 = checkIn;
					
					while(rs.next())
					{
						int hotelId = rs.getInt("hd.hotelId");
						int roomId = rs.getInt("rd.roomId");
						int bookinId = rs.getInt("bd.id");
						String hotelName = rs.getString("hd.hotelName");
						String hotelLocation = rs.getString("hd.hotelLocation");
						String RoomType = rs.getString("rd.RoomType");
						String RoomImage = rs.getString("rd.RoomImage");
						String contactNumber = rs.getString("hd.contactNumber");
						String facilities = rs.getString("rd.facilities");
						String FullBoardRate = rs.getString("rd.FullBoardRate");
						String HalfBoardRate = rs.getString("rd.HalfBoardRate");
						
						

						
						RoomList R = new RoomList(roomId, hotelId, bookinId, hotelName, hotelLocation, RoomType, RoomImage, contactNumber, facilities, FullBoardRate, HalfBoardRate, checkIn1, checkOut1);
						
						RL.add(R);
					}

			}
			catch(Exception e){
				
					e.printStackTrace();
			}


			return RL;
	}



	public static boolean bookingInsertion(String name, String email, String checkin, String checkout, String roomtype, String guests, String board, String note, String contact, String payment, int roomId, String userId) {

	        
	        try {
	            // Get the connection from DBConnect
				con = DBConnect.getConnection();
				stmt = con.createStatement();
	                // Create SQL insert statement
	                String sql = "INSERT INTO booking_details VALUES (0, '" 
	                        + name + "', '" + email + "', '" + checkin + "', '" + checkout + "', '" 
	                        + roomtype + "', '" + guests + "', '" + board + "', '" + note + "', '" 
	                        + contact + "', '" + payment + "', '"+roomId+"', '"+userId+"')";

	                // Execute update and check if successful
	                int rs = stmt.executeUpdate(sql);

	                if(rs>0) {
	    				isSuccess = true;
	    			}
	    			
	    			else {
	    				isSuccess = false;
	    			}
	    		}catch(Exception e){
	    			e.printStackTrace();
	    		}
	    		
	    		return isSuccess;
	}
	
	
    public static List<Customer> getCustomer(int user_id){
    	List<Customer> customer = new ArrayList<>();
    	
    	try {
    		Connection con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		
    		String sql = "Select * from booking_details bd, room_details rd, hotel_details hd where rd.roomId = bd.roomId  AND  rd.hotelId = hd.hotelId AND bd.user_id = '"+user_id+"' ";

    		
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int bookId = rs.getInt("bd.id");
				String userId = rs.getString("bd.user_id");
				String hName = rs.getString("hd.hotelName");
				String hLocation = rs.getString("hd.hotelLocation");
				String checkinDate = rs.getString("bd.checkin");
				String checkOut = rs.getString("bd.checkout");
				String guests = rs.getString("bd.guests");
				String payment = rs.getString("bd.payment");
				String rType = rs.getString("bd.roomtype");
				
				//no need details
				String cusName =rs.getString("bd.name");
				String cusEmail = rs.getString("bd.email");
				String cusBoard = rs.getString("bd.board");
				String cusNote = rs.getString("bd.note");
				String cusContact = rs.getString("bd.contact");
				//int cusRoomId = rs.getInt("bd.room_Id");
				
				Customer objCustomer = new Customer(bookId, cusName, cusEmail,checkinDate, checkOut, rType, guests, cusBoard, cusNote, cusContact, payment,  hName, hLocation, userId);
				customer.add(objCustomer);
			}
			
			con.close();
			
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	return customer;
    	
    }

    public static boolean updateBooking(String bookId, String name, String email, String checkin, String checkout, String roomtype, String guests, String board, String note, String contact, String payment) {
    	
    	boolean isSuccess = false;
        Connection con = null;
        Statement stat = null;
    	
    	try {
    		con = DBConnect.getConnection();
        	if(con != null) {
        		stat = con.createStatement();
        		
        		String sql = "update booking_details set name='"+name+"', email = '"+email+"', checkin = '"+checkin+"', checkout = '"+checkout+"', roomtype = '"+roomtype+"', guests = '"+guests+"', board = '"+board+"', "
        				+ "note = '"+note+"', contact ='"+contact+"', payment ='"+payment+"' where id = "+bookId+"";
        		
                int rs = stat.executeUpdate(sql);

                if (rs > 0) {
                    isSuccess = true;
                } else {
                    isSuccess = false;
                }
                
        	 }
    	}catch(Exception e){
            e.printStackTrace();
        } finally {
            // Close the statement and connection
            try {
                if (stat != null) stat.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return isSuccess;

}
    
    public static boolean deleteBooking(String bookID) {
   
    	
    	try {
        	 con = DBConnect.getConnection();
        	if(con != null) {
        		stmt = con.createStatement();
        		
        		String sql = "delete from booking_details where id = '"+bookID+"'";
        		
                int rs = stmt.executeUpdate(sql);

                if (rs > 0) {
                    isSuccess = true;
                } else {
                    isSuccess = false;
                }
                
        	 }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close the statement and connection
            try {
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return isSuccess;

    }

	public static boolean insertPayment(String name, String email, String cardtype, String cardnumber, String expirydate, String cvc, String amount, int user_id) {

			try{
				con = DBConnect.getConnection();
				stmt  = con.createStatement();

				String sql = "INSERT INTO payment VALUE(0, '"+ name + "','" + email + "','" + cardtype + "','"+cardnumber+"','"+expirydate+"','"+cvc+"','"+amount+"', '"+user_id+"') ";

				int result = stmt.executeUpdate(sql);

				if (result > 0) {
					isSuccess = true;
				} else {
					isSuccess = false;
				}

			} catch (SQLException e) {
				System.out.print("Something happening in database : " + e);
			} catch (Exception e) {

				e.printStackTrace(); // Consider using a logger instead

			}

			return isSuccess;
		
	}
	
	public static List<Payment> readPayment(int user_id){
		List <Payment> payments = new ArrayList<>();
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql ="Select * from payment WHERE user_id = '"+user_id+"' ";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int id =  rs.getInt("Payment_Id");
				String fullname = rs.getString("Full_Name");
				String email = rs.getString("Email");
				String cardtype = rs.getString("Card_Type");
				String cardnumber = rs.getString("Card_Number");
				String expirydate = rs.getString("Expiry_Date");
				String cvc = rs.getString("CVC");
				String totalamount = rs.getString("Total_Amount");
				
				Payment objPayment =new Payment(id, fullname, email, cardtype, cardnumber, expirydate, cvc, totalamount );
				payments.add(objPayment);
			}
			

		}catch (SQLException e) {
			System.out.print("Something happening in database : " + e);
		} catch (Exception e) {

			e.printStackTrace(); // Consider using a logger instead

		}

		return payments;


}

	public static boolean updatePayment(int paymentId, String fname , String email , String ctype , String cnumber, String exdate, String cvc, String tamount, int user_id) {
		boolean isSuccess = false;
		
		try{
			con = DBConnect.getConnection();
			stmt  = con.createStatement();
			
			String sql = "update payment set Full_Name ='"+fname+"',  Email='"+email+"', Card_Type='"+ctype+"', Card_Number='"+cnumber+"', Expiry_Date='"+exdate+"', CVC='"+cvc+"',  Total_Amount='"+tamount+"' where Payment_Id='"+paymentId+"' AND user_id = '"+user_id+"'";
			

			int result = stmt.executeUpdate(sql);

			if (result > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}

		} catch (SQLException e) {
			System.out.print("Something happening in database : " + e);
		} catch (Exception e) {

			e.printStackTrace(); // Consider using a logger instead

		}

		return isSuccess;

	}
	
	public static boolean paymentDelete(int id) {
		boolean isSuccess = false;
		
		try{
			con = DBConnect.getConnection();
			stmt  = con.createStatement();

			String sql = "delete from payment where Payment_Id= '"+id+"'";

			int result = stmt.executeUpdate(sql);

			if (result > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}

		} catch (SQLException e) {
			System.out.print("Something happening in database : " + e);
		} catch (Exception e) {

			e.printStackTrace(); // Consider using a logger instead

		}

		return isSuccess;
		
	}
}