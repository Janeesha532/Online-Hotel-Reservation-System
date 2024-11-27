<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "model.user" %>
<%@ page import = "model.Customer" %>
<%@ page import = "DAO.ohrsDbUtil" %>
<%@ page import = "model.Payment" %>
<%@ page import = "java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="image/jpg" href="css/logo1.jpg"> 
    <title>User Profile</title>
        <script>
        function showSection(sectionId) {
            // Hide all sections
            document.querySelectorAll('.content-section').forEach(function(section) {
                section.style.display = 'none';
            });

            // Show the selected section
            document.getElementById(sectionId).style.display = 'block';
        }
        
        function confirmLogout(){
        	
        	var result = confirm("Are you sure you want to log out?");
        	
        	if(result)
        		{
        			window.location.href = "logoutServlet;"
        		}
        }
        
        function confirmDeletion() {
            return confirm("Are you sure you want to delete the account?");
        }

    </script>
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
        }

        /* Updated header */
        .header {
		    background-color: #2F3645;
		    color: #FFFFFF;
		    padding: 10px 20px;
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
        }
        
        .header-content img{

            width: 100px;
            height: 100px;
            padding: 0px;
            margin: -10px;
        }

        .header h1 {
		    font-size: 30px;
		    font-weight: bold;
        }
        
        .header-content {
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    width: 100%;
		    max-width: 1200px;
		    margin: 0 auto;
}

        .header-nav {
            display: flex;
            gap: 20px;
        }

        .header-nav a {
            color: #FEFBF6;
            text-decoration: none;
        }

        .user-profile span {
                        font-size: 16px;
            display: inline-block; /* Allows for better control of spacing */
            padding: 5px 10px; /* Adds some padding around the text */
            background-color: rgba(255, 255, 255, 0.1); /* Optional: adds a subtle background */
            border-radius: 5px;
            
        }
        
        .user-profile {
        
        	text-align: right;
        	margin-left:auto;
        }
        
        

        /* Updated sidebar */
        .sidebar {
		    width: 200px;
		    background-color: #2F3645;
		    color: #FFFFFF;
		    padding: 20px;
		    height: 100%;
		    position: absolute;
        }

.sidebar h2 {
    color: #FFFFFF;
    text-align: center;
    margin-bottom: 20px;
}

.sidebar ul {
    list-style-type: none;
    padding: 0;
}

.sidebar ul li {
    margin: 20px 0;
}

.sidebar ul li a {
    color: #FFFFFF;
    text-decoration: none;
    display: block;
    padding: 10px;
    background-color: rgba(255, 255, 255, 0.1);
    border-radius: 5px;
    transition: background-color 0.3s;
}

.sidebar ul li a:hover {
    background-color: rgba(255, 255, 255, 0.2);
}

        .delete-btn{
        	margin-top: 15px;
            padding: 10px 20px;
            border: none;
            background-color: #2F3645;
            color: #FFFFFF;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        
        .delete-btn:hover {
            background-color: #414952;
        }
        /* Updated button styles */
        .button {
            margin-top: 15px;
            padding: 12px 25px;
            border: none;
            background-color: #30336b;
            color: #FFFFFF;
            cursor: pointer;
            border-radius: 8px;
            transition: background-color 0.3s, transform 0.3s;
        }

        .button:hover {
            background-color: #535c68;
            transform: scale(1.05);
        }

        .main-content {
            margin-left: 270px;
            padding: 30px;
        }

        .content-section {
            display: none;
        }

      /* Table styling with dark brown outer border */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 40px;
            border: 4px solid #5C4033; /* Dark brown border around the table */
            border-radius: 12px; /* Curved corners for the table */
            overflow: hidden;
        }

        th,
        td {
            border: 2px solid #B67352; /* Visible, lighter brown borders between cells */
            padding: 12px;
            text-align: left;
            color: #666;
            vertical-align: middle;
        }

        th {
            background-color: #ECB159;
            color: #FEFBF6;
            font-weight: bold;
            text-align: center; /* Center text in table header */
            border-bottom: 3px solid #B67352; /* Make the header's bottom border thicker */
        }

        tbody tr:nth-child(even) {
            background-color: #F9F4EF;
        }

        tbody tr:hover {
            background-color: #F1E9E1;
        }
        /* Updated footer */
        .footer {
            background-color: #30336b;
            color: #FFFFFF;
            text-align: center;
            padding: 15px 0;
            position: fixed;
            bottom: 0;
            width: 100%;
            box-shadow: 0px -4px 6px rgba(0, 0, 0, 0.1);
        }
        
        .logout {
		    background-color: #FFC107;
		    color: #FFFFFF;
		    padding: 10px;
		    border: none;
		    width: 100%;
		    border-radius: 5px;
		    cursor: pointer;
		    margin-top: 20px;
		    transition: background-color 0.3s;
		    
		    
}

.sec1 {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px;
    background-color: #FFFFFF;
    border-bottom: 2px solid #E0E0E0;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    margin-left: -50px;
   
}

.sec1 h1 {
    font-size: 24px;
    color: #1E88E5;
}
    </style>
</head>
<body>
    <%
        HttpSession Session = request.getSession(false);
        if (Session != null && Session.getAttribute("username") != null) {
            String username = (String) Session.getAttribute("username");
            List<user> uD = ohrsDbUtil.getUserDetails(username);
            if (uD != null && !uD.isEmpty()) {
                for (user u : uD) {
                    int user_id = u.getUser_id();
                    String name = u.getName();
                    String email = u.getEmail();
                    String address = u.getAddress();
                    String contactNum = u.getContactNum();
                    String dob = u.getDob();
                    String password = u.getPassword();
    %>

    <header class="header">
    <div class="header-content">
            <div>
                <img src="css/logo1.jpg">
            </div>
            
            <nav class="header-nav">
               <a href="#"></a>
                <a href="homePage.jsp">Home Page</a>
                <a href="#">About Us</a>
                <a href="#">FAQ</a>
            </nav>
    </div>

    </header>

    <div class="sidebar">
    <h2><center>User Profile</center></h2>
        <ul>
            <li><a href="#" onclick="showSection('user-details')">User Details</a></li>
            <li><a href="#" onclick="showSection('user-bookings')">Bookings</a></li>
            <li><a href="#" onclick="showSection('payment-details')">Payment Details</a></li>
            
        </ul>
        <button class="logout" onclick="confirmLogout()">Logout</button>
        <br>
        
        
    </div>

    <div class="main-content">
        <!-- User Details Section -->
        <div id="user-details" class="content-section">
      	<div class="sec1">
            <h1>User details</h1>
            <div class="user-profile">
                <span>Welcome, <%=name%> !</span>
            </div>
            
        </div>
        	
            <br>
            <table>
                <tr>
                    <th>Name</th>
                    <td><%= name %></td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td><%= email %></td>
                </tr>
                <tr>
                    <th>Phone</th>
                    <td><%= contactNum %></td>
                </tr>
                <tr>
                    <th>Address</th>
                    <td><%= address %></td>
                </tr>
                <tr>
                    <th>Date of Birth</th>
                    <td><%= dob %></td>
                </tr>
            </table>
            <a href="updateUser.jsp"><button class="button">Edit Details</button></a> 
            	<form action="deleteUser" method="post" onsubmit="return confirmDeletion();">
						<input type="hidden" name="roomId" value="<%= user_id %>" >
								    
						<input type="submit" class="button" value="Delete">
				</form>
         
        </div>

        <!-- User Bookings Section -->
        <div id="user-bookings" class="content-section" style="display:none;">
            <div class="sec1">
            <h1>Booking Details</h1>
            <div class="user-profile">
                <span >Welcome, <%=name%> !</span>
            </div>
            
        </div>
            <br>
            <table>
                <thead>
                    <tr>
                        <th>Hotel Name</th>
                        <th>Location</th>
                        <th>Check-in Date</th>
                        <th>Check-out Date</th>
                        <th>Guests</th>
                        <th>Payment Method</th>
                        <th>Room Type</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    
              	List<Customer> customer = ohrsDbUtil.getCustomer(u.getUser_id());
        	   if (customer != null && !customer.isEmpty()) {
               for (Customer cus : customer) {
            	 
    %>
        <tr>
            <td><%= cus.gethName() %></td>
            <td><%= cus.gethLocation() %></td>
            <td><%= cus.getCheckDate() %></td>
    		<td><%= cus.getCheckOut() %></td>
            <td><%= cus.getGuests() %></td>
            <td><%= cus.getPayment() %></td>
            <td><%= cus.getRoomtype() %></td>
            
            
            <c:set var = "bookId" value ="<%= cus.getBookID() %>" />
            <c:set var = "cusname" value ="<%= cus.getCusName() %>" />
            <c:set var = "cusemail" value ="<%= cus.getCusEmail() %>" />
            <c:set var = "indate" value ="<%= cus.getCheckDate() %>" />
            <c:set var = "outdate" value ="<%= cus.getCheckOut() %>" />
            <c:set var = "roomtype" value ="<%= cus.getRoomtype() %>" />
            <c:set var = "guests" value ="<%= cus.getGuests() %>" />
            <c:set var = "board" value ="<%= cus.getBoard() %>" />
            <c:set var = "note" value ="<%= cus.getNote() %>" />
            <c:set var = "contact" value ="<%= cus.getContact() %>" />
            <c:set var = "payment" value ="<%= cus.getPayment() %>" />
           
            
            <c:url value = "updateBooking.jsp" var ="bookingUpdate">
            	<c:param name="bookId" value = "${bookId}" />
            	<c:param name="name" value = "${cusname}" />
            	<c:param name="email" value = "${cusemail}" />
            	<c:param name="checkin" value = "${indate}" />
            	<c:param name="checkout" value = "${outdate}" />
            	<c:param name="roomtype" value = "${roomtype}" />
            	<c:param name="guests" value = "${guests}" />
            	<c:param name="board" value = "${board}" />
            	<c:param name="note" value = "${note}" />
            	<c:param name="contact" value = "${contact}" />
            	<c:param name="payment" value = "${payment}" />
            </c:url>	
           
            
            <td>
            
            		<a href ="${bookingUpdate}"> <input type="button" class="delete-btn" value ="Modify"></a>
            		
            	<form action="bookingDeleteServlet" method="post" style="display: inline;">
            	
        			<input type="hidden" name="bookID" value="<%= cus.getBookID() %>" />
        			
        			<input type="submit" class="delete-btn" name="delete" value ="Delete">
        			
        		</form>
            </td>
        </tr>
    <%
            }
        } else {
    %>
        <tr>
            <td colspan="8">No bookings available.</td>
        </tr>
    <%
        }
    %>
                </tbody>
            </table>
        </div>


			<%
					List<Payment> pd = ohrsDbUtil.readPayment(user_id);
			
						if (pd != null && !pd.isEmpty()) 
						{
	
			
			%>

        <!-- Payment Details Section -->
        <div id="payment-details" class="content-section" style="display:none;">
        <div class="sec1">
            <h1>Payment Details</h1>
            <div class="user-profile">
                <span>Welcome, <%=name%> !</span>
            </div>
        </div>
            <br>
            <table>
                <thead>
                    <tr>
                        <th>Card Type</th>
                        <th>Expiry Date</th>
                        <th>Card No</th>
                        <th>CVV</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                <%
				    for (Payment pdetails : pd){
					
                %>
                    <tr>
                        <td><%= pdetails.getCardType() %></td>
                        <td><%= pdetails.getExpiryDate() %></td>
                        <td><%= pdetails.getCardNumber() %></td>
                        <td><%= pdetails.getCVC() %></td>
                        
                        
               <td>
            
            		<a href ="paymentUpdate.jsp"> <input type="button" class="delete-btn" value ="Modify"></a>
            		
            	<form action="paymentDeleteServlet" method="post" style="display: inline;">
            	
        			<input type="hidden" name="paymentId" value="<%= pdetails.getPaymentId() %>" />
        			
        			<input type="submit" class="delete-btn" name="delete" value ="Delete">
        			
        		</form>
            </td>
                              <%
				    		} 
				    			
				    
			                    
			        
				    		}
						else
						{
							
							
                    
                    %>
                        
                        
                        
                    </tr>
                    

                    
               
			   
                    <!-- Repeat similar rows for more payments -->
                </tbody>
            </table>
           
                    <%
        
						}
						
                }
                }else{		    
				
                response.sendRedirect("homePage.jsp");
            }
        %>

        </div>
        

    </div>
		<%

        } else {
            response.sendRedirect("login.jsp");
        }
    %>
</body>
</html>
