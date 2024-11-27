<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import = "java.util.List" %>
    <%@ page import = "model.Room" %>
    <%@ page import = "model.Hotel" %>
    <%@ page import = "DAO.ohrsDbUtil" %>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="image/jpg" href="css/logo1.jpg"> 
    <title>Hotel Admin Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
<script>
    function confirmDeletion() {
        return confirm("Are you sure you want to delete this room?");
    }
    
    function showSection(sectionId) {
        // Hide all sections
        document.querySelectorAll('.main-content').forEach(function(section) {
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
</script>
</head>

<body>
    
                        <%
                    
		                    HttpSession session1 = request.getSession(false);
		                    if (session1 != null && session1.getAttribute("username") != null) {
		                        String username = (String) session1.getAttribute("username");
		                        
                   	 %>


    <header class="header">
        <div class="header-content">
            <div>
                <img src="css/logo1.jpg">
                
            </div>
        </div>
    </header>

   <div class="sidebar">
    	
        <h2>Admin Dashboard</h2>
        <ul>
            <li><a href="#" onclick="showSection('maincontent')">Manage Rooms</a></li>
            <!--<li><a href="#">Manage Reservations</a></li>-->
            <li><a href="#" onclick="showSection('FAQs')">FAQs and Inquiries</a></li>
            <li><a href="#" onclick="showSection('ManageOffers')">Manage Offers</a></li>
            <li><a href="#" onclick="showSection('userACC')">User Accounts</a></li>
            <li><a href="#">Reports</a></li>
        </ul>
        <button class="logout" onclick="confirmLogout()">Logout</button>
        
    </div>

			<%
			
		            List<Hotel> hotelD = ohrsDbUtil.getHotelDetails(username); 
			            
			         	if(hotelD != null && !hotelD.isEmpty())
			         	{
			         		for(Hotel h: hotelD)
			         		{ 
			         			int hotelId = h.getHotelId();
			         			String hotelName = h.getHotelName();
			         			String hotelLocation = h.getHotelLocation();
			         			String contactNumber = h.getContactNumber();
			         			String hotelImage = h.getHotelImage();
			         			String managerUsername = h.getManagerUsername();
			         			String managerPassword = h.getManagerPassword();
			         			
			         		
			%>
    <div id="maincontent" class="main-content" >
        <div class="sec1">
            <h1><%= hotelName %></h1>
            <div class="user-profile">
                <span>Welcome, <%=username%> !</span>
            </div>
        </div>
        
     

        <div class="dashboard">
            <!-- Room List Section -->
            <div class="room-list">
                <h2>Manage Rooms</h2>
            <table>
                    <thead>
                        <tr>
                            <th>Room Image</th>
                            <th>Room Type</th>
                            <th>Full Board Rate</th>
                            <th>Half Board Rate</th>
                            <th>Facilities</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                    
							<%
							List<Room> rooms = ohrsDbUtil.getAllRooms(hotelId);
		                    
	                    	if(rooms != null && !rooms.isEmpty())
	                    	{
	                    		for (Room room : rooms)
	                    		{
								
							%>
                   		 
                        <tr>
                            <td><img src="<%= room.getRoomImage() %>" alt="Room Image"></td>
                            <td><%= room.getRoomType() %></td>
                            <td><%= room.getFullBoardRate() %></td>
                            <td><%= room.getHalfBoardRate() %></td>
                            <td><%= room.getFacilities() %></td>
                           <td></td>
                           
                           
                           <c:set var="roomid" value="<%= room.getRoomId() %>" />
                           <c:set var="roomtype" value="<%= room.getRoomType() %>" />
                           <c:set var="roomimage" value="<%= room.getRoomImage() %>" />
                           <c:set var="fullboardrate" value="<%= room.getFullBoardRate() %>" />
                           <c:set var="halfboardrate" value="<%= room.getHalfBoardRate() %>" />
                           <c:set var="facilities" value="<%= room.getFacilities() %>" />
                           
                           <c:url value="updateRoom.jsp" var="roomupdate">
                           		<c:param name="roomid" value="${roomid}"/>
                           		<c:param name="roomtype" value="${roomtype}"/>
                           		<c:param name="roomimage" value="${roomimage}"/>
                           		<c:param name="fullboardrate" value="${fullboardrate}"/>
                           		<c:param name="halfboardrate" value="${halfboardrate}"/>
                           		<c:param name="facilities" value="${facilities}"/>
                           </c:url>
                          <td>
                          		<a href="${roomupdate}"> <input type="button" class="edit-btn" value="Edit "></a> 
                          		
                          		<form action="delete" method="post" onsubmit="return confirmDeletion();">
								    <input type="hidden" name="roomId" value="${roomid}" >
								    
								    <input type="submit" class="delete-btn" value="Delete">
								</form>

                          		
                          </td>
                            

                        </tr>
                        <%
                        
	                    		}
	                    	}
	                    	
	                    	%>

                    
                    </tbody>
                </table>  
           
                <div class="pagination">
                    <button>&laquo; Previous</button>
                    <button>Next &raquo;</button>
                </div>
            </div>

            <!-- Add Room Section -->
            <div class="add-room-form">
                <h2>Add New Room</h2>
                <form action="insert" method="post">
                
               		 <input type="hidden" name="hotelId" value="<%=hotelId %>" readonly>
                    <label for="room-type">Room Type:</label>
                    <select id="room-type" name="RoomType"  >
                        <option value="single">Single</option>
                        <option value="double">Double</option>
                        <option value="suite">Suite</option>
                        <option value="deluxe">Deluxe</option>
                    </select>
                    
                    <label for="full-board-rate">Full Board Rate:</label>
                    <input type="number" id="full-board-rate" name="FullBoardRate" placeholder="Enter full board rate" required>

                    <label for="half-board-rate">Half Board Rate:</label>
                    <input type="number" id="half-board-rate" name="HalfBoardRate" placeholder="Enter half board rate" required>

                    <!-- Facilities Selection -->
                    <label for="facilities">Facilities:</label>
                    <input type="text" name="facilities" class="facilities" placeholder="free wi-fi, pool access, free parking, gym access ect" >
                    <!--<select id="facilities" name="Facilities" multiple>
                        <option value="wifi">Free Wi-Fi</option>
                        <option value="pool">Pool Access</option>
                        <option value="parking">Free Parking</option>
                        <option value="gym">Gym Access</option>
                        <option value="massage">Free Massage</option>
                    </select>-->

                    <!-- Image URL instead of Upload -->
                    <label for="room-image-url">Room Image URL:</label>
                    <input type="text" id="room-image-url" name="RoomImage" placeholder="Enter image URL" required>

                    <input type="submit" class="add-room-btn" value="Add Room">
                </form>
            </div>
        </div>
    </div>
	
	<div id="FAQs" class= "main-content" style="display:none;">
	<h2 class="T"> FAQ</h2>
	</div>

	<div id="ManageOffers" class="main-content" style="display:none;">
	<h2 class="T"> Manage Offers</h2>
	</div>
	
	<div id="userACC" class="main-content" style="display:none;">
	<h2 class="T"> user account</h2>
	</div>
	
	<div id="Reports" class="main-content" style="display:none;">
	<h2 class="T">Reports</h2>	</div>
	
		                    	<%
			         		}
			         	}
	                    	
		                    } else {
		                        response.sendRedirect("login.jsp");
		                    }
		                    	
                        %>
</body>
</html>
