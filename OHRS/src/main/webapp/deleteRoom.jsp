<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Admin Dashboard</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            color: #333;
            /*display: flex;
            flex-direction: column;
            min-height: 100vh;*/
        }

        /* Header styling */
        .header {
            background-color: #2F3645;
            color: #ffffff;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
   			align-items: center;
        }
        
        .header-content{
        	    display: flex;
			    justify-content: space-between;
			    align-items: center;
			    width: 100%;
			    max-width: 1200px;
			    margin: 0 auto;
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

        /* Sidebar styling */
        .sidebar {
            width: 200px;
            background-color: #2F3645;
            color: #FFFFFF;
            position: absolute;
            height: 100%;
            padding: 20px;
           /* box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);*/
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
            background-color: #2980b9;
        }

        .logout {
            background-color: #e74c3c;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            margin-top: 30px;
            transition: background-color 0.3s;
        }

        .logout:hover {
            background-color: #c0392b;
        }

        /* Main content styling */
        .main-content {
            margin-left: 240px;
            padding: 40px;
           /* flex-grow: 1;*/
        }

        .sec1 {
            background-color: #ecf0f1;
            padding: 20px;
            border-radius: 8px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .sec1 h1 {
            font-size: 24px;
            color: #2980b9;
        }

        .user-profile span {
            font-size: 18px;
            color: #2c3e50;
        }

        /* Dashboard sections */
       .dashboard {
            justify-content: space-between;
            gap: 20px;
        }

        .room-list {
        	display-content: center;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            width: 500px;
        }

        .room-list h2, .add-room-form h2 {
            margin-bottom: 20px;
            font-size: 22px;
            color: #2980b9;
        }

        .room-list img {
            width: 100%;
            height: 300px;
            object-fit: cover;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .room-list ul {
            list-style: none;
            padding: 0;
        }

        .room-list ul li {
            margin-bottom: 10px;
            font-size: 16px;
        }

       /* .add-room-form label {
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
        }*/

    </style>
</head>
<body>

		<%
	    
        
    
            HttpSession session1 = request.getSession(false);
            if (session1 != null && session1.getAttribute("username") != null) {
                String username = (String) session1.getAttribute("username");


				String id = request.getParameter("roomid");
				String image = request.getParameter("roomimage");
				String roomtype = request.getParameter("roomtype");
				String fullboardrate = request.getParameter("fullboardrate");
				String halfboardrate = request.getParameter("halfboardrate");
				String facilities = request.getParameter("facilities");
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
            <li><a href="#">Manage Rooms</a></li>
            <li><a href="#">FAQs and Inquiries</a></li>
            <li><a href="#">Manage Offers</a></li>
            <li><a href="#">Analytics</a></li>
            <li><a href="#">User Accounts</a></li>
            <li><a href="#">Reports</a></li>
        </ul>
        <button class="logout">Logout</button>
    </div>

    <div class="main-content">
        <div class="sec1">
            <h1>Hotel Name</h1>
            <div class="user-profile">
                <span>Welcome, <%=username%> !</span>
            </div>
        </div>
        
    

        <div class="dashboard">
            <!-- Room List Section -->
            <div class="room-list">
                <h2>Update Room - Room Preview</h2>
                <img src="<%= image %>" alt="Room Image">
                <ul>
                    <li>Room Type: <strong><%= roomtype %></strong></li>
                    <li>Full Board Rate: <strong><%= fullboardrate %></strong></li>
                    <li>Half Board Rate: <strong><%= halfboardrate %></strong></li>
                    <li>Facilities: <strong><%= facilities %></strong></li>
                </ul>
            </div>


        </div>
    </div>
    <%
            } else {
                response.sendRedirect("login.jsp");
            }
        %>
</body>
</html>
