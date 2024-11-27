<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="model.Hotel" %>
    <%@ page import = "model.user" %>
    <%@ page import = "java.util.List" %>
    <%@ page import = "DAO.ohrsDbUtil" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Room Booking Form</title>
    
    <!-- CSS changes for consistency with Hotel Registration Form -->
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: #F5F5F5;
            color: #333333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 200vh; /* Adjust to take full viewport height */
            padding: 20px;
        }

        .form-wrapper {
            display: flex;
            background-color: #FFFFFF;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            width: 100%;
        }

        .form-section {
            padding: 30px;
            width: 60%;
            background-color: #FAEDD8;
        }

        .form-section h1 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 28px;
            color: #1E88E5;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .form-group label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #333333;
        }

        .form-group input[type="text"],
        .form-group input[type="email"],
        .form-group input[type="date"],
        .form-group input[type="number"],
        .form-group input[type="tel"],
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            margin-bottom: 15px;
            color: #333;
            background-color: #FAEDD8;
        }

        button[type="submit"] {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #1E88E5, #64B5F6);
            color: #FFFFFF;
            font-size: 18px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button[type="submit"]:hover {
            background: linear-gradient(135deg, #1565C0, #3F51B5);
        }

        .image-section {
            width: 40%;
            border-top-right-radius: 10px;
            border-bottom-right-radius: 10px;
            overflow: hidden;
        }

        .image-section img {
            width: 100%;
            height: auto;
            object-fit: cover;
        }
    </style>
</head>
<body>

	<%
	    HttpSession session1 = request.getSession(false);
	    if (session1 != null && session1.getAttribute("username") != null) {
	        String username = (String) session1.getAttribute("username");
	        
	        List<user> u = ohrsDbUtil.getUserDetails(username);
	        
	        if(u != null && !u.isEmpty())
	        {
	        	for(user uD: u )
	        	{
	        		int userId = uD.getUser_id();
	        	
	        
	        
	        String roomid = request.getParameter("roomId");
			String checkin =request.getParameter("checkin");
			String checkout = request.getParameter("checkout");
			String roomtype = request.getParameter("roomtype");
        
		
	%>
    <div class="form-wrapper">
        <div class="form-section">
            <h1>Customer Room Booking Form</h1>
            <form action="bookingServlet" method="POST">
            
            	<input type = "hidden" name="roomId" value="<%= roomid %>" readonly>
            	
            	<input type = "hidden" name="userId" value="<%= userId %>" readonly>
            	
            	
                <div class="form-group">
                    <label for="name">Full Name:</label>
                    <input type="text" id="name" name="name" placeholder="Enter your full name" required>
                </div>
                
                <div class="form-group">
                    <label for="email">Email Address:</label>
                    <input type="email" id="email" name="email" placeholder="Enter your email address" required>
                </div>

                <div class="form-group">
                    <label for="checkin">Check-in Date:</label>
                    <input type="date" id="checkin" name="checkin" value="<%= checkin %>" readonly>
                </div>

                <div class="form-group">
                    <label for="checkout">Check-out Date:</label>
                    <input type="date" id="checkout" name="checkout" value="<%= checkout %>" readonly>
                </div>

                <div class="form-group">
                    <label for="roomtype">Room Type:</label>
                    <select id="roomtype" name="roomtype" >
                        <option value="<%= request.getParameter("roomtype") %>"  selected> <%= request.getParameter("roomtype") %> </option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="guests">Number of Guests:</label>
                    <input type="number" id="guests" name="guests" min="1" placeholder="Enter the number of guests" required>
                </div>

                <div class="form-group">
                    <label for="board">Board Type:</label>
                    <select id="board" name="board" required>
                        <option value="" disabled selected>Select board type</option>
                        <option value="full">Full Board</option>
                        <option value="half">Half Board</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="note">Additional Notes:</label>
                    <textarea id="note" name="note" rows="4" placeholder="Any special requests or notes"></textarea>
                </div>

                <div class="form-group">
                    <label for="contact">Contact Number:</label>
                    <input type="tel" id="contact" name="contact" placeholder="Enter your contact number" required>
                </div>

                <div class="form-group">
                    <label for="payment">Payment Method:</label>
                    <select id="payment" name="payment" required>
                        <option value="" disabled selected>Select payment method</option>
                        <option value="creditcard">Credit Card</option>
                        <option value="debitcard">Debit Card</option>
                        <option value="paypal">PayPal</option>
                        <option value="cash">Cash on Arrival</option>
                    </select>
                </div>

                <div class="form-group">
                    <button type="submit">Submit Booking</button>
                </div>
                <br>

            </form>
                 <div>
                	<a href="homePage.jsp"><button type="submit">Home Page</button></a>
                </div>
        </div>

        <div class="image-section">
            <img src="https://i.pinimg.com/236x/5d/f9/66/5df96623ccfa802194820a0c16b24061.jpg" alt="Hotel Image1">
            <img src="https://i.pinimg.com/236x/94/d2/b3/94d2b3656f7ab4b823df2d6dda89bee3.jpg" alt="Hotel Image1">
        </div>
    </div>
    
    <%
	        	}
	        }
	    } else {
            response.sendRedirect("login.jsp");
        }
    %>
</body>
</html>
