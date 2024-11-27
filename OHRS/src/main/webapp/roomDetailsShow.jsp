<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "DAO.ohrsDbUtil" %>
<%@ page import = "model.Hotel" %>
<%@ page import = "model.Room" %>
<%@ page import = "model.user" %>
<%@ page import = "model.RoomList" %>
<%@ page import = "java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/jpg" href="css/logo1.jpg">
    <title>StayMaster - Find your next stay</title>

    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #FEFBF6;
            color: #B67352;
        }

        body::-webkit-scrollbar {
            display: none;
        }




        .header {
            background-color: #2F3645;
            color: #FFFFFF;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
        }

        .imageContainer {
            margin-left: 30px;
        }

        .header-content img {
            width: 90px;
            height: 90px;
            padding: 0px;
        }

        .header h1 {
            font-size: 30px;
            font-weight: bold;
            text-align: left;
        }

        .header-nav {
            display: flex;
            gap: 20px;
        }

        .header-nav a {
            color: #FEFBF6;
            text-decoration: none;
        }

        .header-actions {
            display: flex;
            gap: 10px;
        }

        .header-actions select, .header-actions button {
            padding: 5px 10px;
            border: none;
            border-radius: 3px;
            background-color: #98DED9;
            color: #000000;
        }

        .hero {
            position: relative;
            padding: 40px 20px;
            border-radius: 5px;
            margin-bottom: 20px;
            color: #FEFBF6;
            overflow: hidden;
        }

        .h1::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-image: url('css/bg.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            z-index: -1;
            opacity: 1;
        }

        .h1 {
            position: relative;
            z-index: 2;
        }

        .hero h2 {
            font-size: 48px;
            font-weight: 700;
            margin-bottom: 20px;
            color: #ffffff;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            letter-spacing: 1px;
            animation: fadeInUp 0.8s ease-out;
        }

        .hero p {
            font-size: 24px;
            margin-bottom: 30px;
            color: #ffffff;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
            max-width: 800px;
            line-height: 1.6;
            animation: fadeInUp 1s ease-out 0.2s;
            animation-fill-mode: both;
            font-weight: 500;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .no-Class {
            margin-top: 30px;
        }

        .search-container {
            display: flex;
            align-items: center;
            background: linear-gradient(to right, #98DED9, #EEDF7A);
            border-radius: 15px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            width: 100%;
            max-width: 1500px;
            padding: 10px;
            color: #fff;
        }

        .search-container input,
        .search-container select {
            background-color: #FEFBF6;
            border: none;
            padding: 15px;
            outline: none;
            font-size: 16px;
            color: #B67352;
            flex: 1;
            transition: background-color 0.3s ease;
            border-radius: 8px;
        }

        .search-container input[type="date"]::-webkit-calendar-picker-indicator {
            filter: invert(100%);
        }

        .search-container input:focus,
        .search-container select:focus {
            background-color: #dcd1bf;
        }

        .search-container input {
            margin-right: 10px;
        }

        .search-container .icon {
            margin-right: 10px;
            font-size: 20px;
            color: #666;
        }

        .search-container select,
        .search-container input[type="number"] {
            background-color: #FEFBF6;
            margin-right: 10px;
            padding-right: 20px;
            color: #B67352;
            border-radius: 8px;
        }

        .search-container input[type="submit"] {
            background-color: #ECB159;
            color: white;
            padding: 15px 30px;
            border: none;
            cursor: pointer;
            font-size: 16px;
            border-radius: 8px;
            transition: background-color 0.3s;
            margin-left: 10px;
        }

        .search-container input[type="submit"]:hover {
            background-color: #00a1cc;
        }

        .search-container .input-group {
            display: flex;
            align-items: center;
            flex: 1;
        }

        .search-container input[type="date"] {
            padding: 12px 15px;
            background-color: #FEFBF6;
            color: #B67352;
            font-size: 16px;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }

        .search-container input[type="date"]:hover,
        .search-container input[type="text"]:hover {
            background-color: #dcd1bf;
        }

        a {
            text-decoration: none;
            color: white;
        }

        .hotel-list {
  		display: grid;
        grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));

        margin: 40px auto;
        padding: 0 20px;
            
        }

        .hotel-item {
        background-color: white;
        border-radius: 12px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        overflow: hidden;
        display: flex;
        flex-direction: column;
        }

        .hotel-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .hotel-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .hotel-info {
        padding: 15px;
        text-align: center;
        flex: 1;
        display: flex;
        flex-direction: column;
        }

        .hotel-name {
        font-size: 22px;
        font-weight: bold;
        margin: 10px 0;
        color: #003580;
        }

        .hotel-location {
        font-size: 14px;
        color: #666;
        margin-bottom: 10px;
        }


        .hotel-features {
       font-size: 14px;
        color: #008009;
        margin-bottom: 15px;
        }

        .hotel-price {
        font-size: 18px;
        color: #333;
        margin-bottom: 10px;
        }

        .price-label {
       font-weight: bold;
        color: #003580;
        }

        .price-value {
            color: #008009;
        }

        .availability-btn {
        background-color: #0071c2;
        color: white;
        border: none;
        padding: 12px 20px;
        border-radius: 25px;
        cursor: pointer;
        width: 100%;
        font-size: 16px;
        transition: background-color 0.3s ease;
        }

        .availability-btn:hover {
            background-color: #005999;
        }
        
        .ann{
        
        	display: flex;
        }

        @media (max-width: 768px) {
            .hotel-list {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>

    <%
        HttpSession session1 = request.getSession(false);
        if (session1 != null && session1.getAttribute("username") != null) {
            String username = (String) session1.getAttribute("username");

            List<user> uD = ohrsDbUtil.getUserDetails(username);

            if (uD != null && !uD.isEmpty()) {
                for (user u : uD) {
                    String name = u.getName();
    %>
   
    <div class="h1">
        <header class="header">
            <div class="header-content">
                <div class="imageContainer">
                    <img src="css/logo1.jpg">
                </div>
                <nav class="header-nav">
                    <a href="homePage.jsp">Home Page</a>
                    <a href="user.jsp">User Profile</a>
                    <a href="#">About Us</a>
                    <a href="#">FAQ</a>
                </nav>
                <div class="header-actions">
                    <h3>Welcome <a href="user.jsp#"> <%= name %> ! </a></h3>
                </div>
            </div>
        </header>
        <section class="hero">
            <div class="hero-content">
                <div class="no-Class">
                    <h2>Find your next stay</h2>
                    <p>Search deals on hotels, homes, and much more...</p>
                    <form method="post" action="searchRoom">
                        <div class="search-container">
                            <div class="input-group">
                                <span class="icon">🛏</span>
                                <input type="text" name="location" placeholder="Where are you going?" value="" required>
                            </div>
                            <div class="input-group">
                                <span class="icon">📅</span>
                                <input type="date" name="check-in" placeholder="Check-in date" value="" required>
                            </div>
                            <div class="input-group">
                                <span class="icon">📅</span>
                                <input type="date" name="check-out" placeholder="Check-out date" value="" required>
                            </div>
                            <div class="input-group">
                                <span class="icon">🏨</span>
                                <select name="RoomType" placeholder="Select room type" required>
                                    <option value="" disabled selected>Select room type</option>
                                    <option value="single">Single</option>
                                    <option value="double">Double</option>
                                    <option value="suite">Suite</option>
                                    <option value="deluxe">Deluxe</option>
                                </select>
                            </div>
                            <div class="input-group">
                                <input type="submit" value="Search">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </div>
    <%
                }
                List<RoomList> roomL = (List<RoomList>) request.getAttribute("roomL");

                if (roomL != null && !roomL.isEmpty()) {
                    for (RoomList rooms : roomL) {
    %>
    
     <div class="container">
 <div class="ann">   
    <div class="hotel-list">
        <div class="hotel-item">
            <img src="<%= rooms.getRoomImage() %>" alt="<%= rooms.getHotelName() %>" class="hotel-image">
            <div class="hotel-info">
                <h3 class="hotel-name"><%= rooms.getHotelName() %></h3>
                <p class="hotel-location"><%= rooms.getHotelLocation() %></p>
                
                <p class="hotel-features"><%= rooms.getFacilities() %></p>
                <p class="hotel-price">
                    <span class="price-label">Full Board:</span>
                    <span class="price-value"> LKR <%=  rooms.getFullBoardRate()%>.00</span>
                </p>
                <p class="hotel-price">
                    <span class="price-label">Half Board:</span>
                    <span class="price-value">LKR <%= rooms.getHalfBoardRate()%>.00</span>
                </p>
                <c:set var="roomId" value="<%= rooms.getRoomId() %>"/>
                <c:set var="checkin" value="<%= rooms.getCheckIn() %>"/>
                <c:set var="checkout" value="<%= rooms.getCheckOut() %>"/>
                <c:set var="roomtype" value="<%= rooms.getRoomType() %>"/>
                <c:url value="bookingInsert.jsp" var="booking">
                    <c:param name="roomId" value="${roomId}"/>
                    <c:param name="checkin" value="${checkin}"/>
                    <c:param name="checkout" value="${checkout}"/>
                    <c:param name="roomtype" value="${roomtype}"/>
                </c:url>
                <a href="${booking}"><input type="button" class="availability-btn" value="Book Now"></a>
            </div>
        </div>
        </div>
            <%
                    }
                } else {
    %>
    <h1 style="color:red; text-align: center;">No Rooms Available.</h1>
    
    

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
