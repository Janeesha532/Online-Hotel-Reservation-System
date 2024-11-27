<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "model.user" %>
<%@ page import = "DAO.ohrsDbUtil" %>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="image/jpg" href="css/logo1.jpg"> 
    <title>User Profile</title>
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

        .header .user-profile span {
            font-size: 16px;
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


        /* Updated button styles */
        button {
            margin-top: 15px;
            padding: 12px 25px;
            border: none;
            background-color: #30336b;
            color: #FFFFFF;
            cursor: pointer;
            border-radius: 8px;
            transition: background-color 0.3s, transform 0.3s;
        }

        button:hover {
            background-color: #535c68;
            transform: scale(1.05);
        }

        .main-content {
            margin-left: 270px;
            padding: 30px;
        }

      

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table th, table td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: left;
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
        
        .Back {
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

        .add-room-form label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }

        .add-room-form input, 
        .add-room-form select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .add-room-btn {
            background-color: #2980b9;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }

        .add-room-btn:hover {
            background-color: #1a6fa5;
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
            <h1>StayMaster</h1>
        </div>
    </header>

    <div class="sidebar">
    <h2><center>User Profile</center></h2>
        <ul>
            <li><a >Update</a></li>
        </ul>
        <a href="user.jsp"> <button class="Back">Go Back</button></a>
        
    </div>

    <div class="main-content">
        <!-- User Details Section -->
        <div id="user-details" class="content-section">
      	<div class="sec1">
            <h1>User details - Update </h1>
            <div class="user-profile">
                <span>Welcome, <%=name%> !</span>
            </div>
        </div>
        	
            <br>
            <!-- Add Room Section -->
            <div class="add-room-form">
                
                <form action="updateUserDetails" method="post">
                	<input type="hidden" name="user_id" value="<%= user_id %>" readonly>	

                    <label for="full-board-rate">Name:</label>
                    <input type="text" id="full-board-rate" name="name" value="<%= name %>" required>

                    <label for="half-board-rate">Email:</label>
                    <input type="email" id="half-board-rate" name="email" value="<%= email %>"  required>

                    <label for="facilities">Address:</label>
                    <input type="text" id="facilities" name="address" value="<%= address %>"  required>

                    <label for="room-image-url">Contact Number:</label>
                    <input type="text" id="room-image-url" name="contactNum" value="<%= contactNum %>"  required>
                    
                    <label for="room-image-url">Date Of Birth:</label>
                    <input type="date" id="room-image-url" name="dob" value="<%= dob %>"  required>
                    
                    <label for="room-image-url">password:</label>
                    <input type="text" id="room-image-url" name="password" value="<%= password %>"  required>

                    <input type="submit" class="add-room-btn" value="Save Changes">
                </form>
            </div>

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
