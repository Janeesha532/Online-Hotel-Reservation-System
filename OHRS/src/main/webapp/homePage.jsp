<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       		<%@ page import = "DAO.ohrsDbUtil" %>
           <%@ page import = "model.Hotel" %>
           <%@ page import = "model.Room" %>
    		<%@ page import = "model.user" %>
    		<%@ page import = "java.util.List" %>
       
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/jpg" href="css/logo1.jpg"> 
    <title>StayMaster - Find your next stay</title>
    <style>
    
    @media (max-width: 768px) {
    .card-container {
        grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
    }
}
    
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
        
        .imageContainer{
        
        	margin-left: 30px;
        }
        
        .header-content img{

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

        .main-content {
            max-width: 1500px;
            margin: 0 auto;
            padding: 20px;
            height: 100%;
        }

        /* Hero section with background image */
        .hero {
            position: relative; /* Required for positioning the overlay */
            padding: 40px 20px;
            border-radius: 5px;
            margin-bottom: 20px;
            color: #FEFBF6; /* White text to contrast with the image */
            overflow: hidden; /* Ensures no overflow outside the border */
        }

        /* Background image styling */
       .h1::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-image: url('css/bg.jpg'); /* Replace with your image URL */
           background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            z-index: -1; /* Place it behind the content */
           opacity:1; /* Adjust opacity to allow text readability */
      }

        /* Hero content styling, displayed on top of the background image */
        .h1 {
            position: relative;
            z-index: 2; /* Ensures content appears above the background image */
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
		    /*margin-left: auto;
		    margin-right: auto;*/
		    line-height: 1.6;
		    animation: fadeInUp 1s ease-out 0.2s;
		    animation-fill-mode: both;
		    font-weight:500;
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
        
        .no-Class{
        
        	margin-top: 30px
        }

         .search-container {
            display: flex;
            align-items: center;
            background: linear-gradient(to right, #98DED9, #EEDF7A);
            /*background-color: #222;*/
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

        /* Modern hover effect */
        .search-container input[type="date"]:hover,
        .search-container input[type="text"]:hover {
            background-color: #dcd1bf;
        }


        .recent-searches{
            display: flex;
        }
        
        .PD{
        	font-size: 36px;
            color: #B67352;
            margin-bottom: 10px;
            margin-left: 30px;
        
        }

        .recent-searches, .interested-properties {
            margin-top: 30px;
        }

        .search-cards{
            display: flex;
            grid-template-columns: repeat;
            gap: 20px;
            /*overflow-x: auto;*/
        }

        .property-card{
            display: flex;
           /* grid-template-columns: repeat;
            gap: 20px;
            overflow-x: auto;*/
        }

        .search-card, .property-card {
            background-color: #FEFBF6;
            border-radius: 5px;
            overflow: hidden;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            /*min-width: 200px;*/
            transition: transform 0.3s;
            max-width: 1500px;
            margin-left: 20px;
        }

        .search-card:hover, .property-card:hover {
            transform: scale(1.05);
        }

        .search-card img, .property-card img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .property-card img{
            width: 100%;
            height: 200px;
        }

        .card-info {
            padding: 10px;
        }

        .card-info h3 {
            font-weight: bold;
            margin-bottom: 5px;
            color: #B67352;
        }

        .card-info p {
            color: #B67352;
            font-size: 14px;
        }

        .footer {
            background-color: #2F3645;
            color: #FEFBF6;
            text-align: center;
            padding: 10px 0;
            /*position: absolute;*/
            width: 100%;
   
        }

        .footer-links {
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        .footer-links a {
            color: #FEFBF6;
            text-decoration: none;
        }
        	a {
    		text-decoration: none;
    		color: white;
			}
			
			 .offers-section {
            max-width: 1500px;
            margin: 40px auto;
            padding: 0 20px;
            text-align: center;
        }

        .offers-section h2 {
            font-size: 36px;
            margin-bottom: 10px;
            text-align: left;
        }

        .offers-section p {
            font-size: 16px;
            color: #666;
            margin-bottom: 30px;
            text-align: left;
        }

        .offers-container {
            display: flex;
            overflow-x: auto;
            gap: 20px;
            padding-bottom: 20px;
        }

        .offer-card {
            display: flex;
            justify-content: space-between;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            align-items: center;
            min-width: 300px;
            flex-shrink: 0;
        }

        .offer-text {
            text-align: left;
            max-width: 60%;
        }

        .offer-text h3 {
            font-size: 20px;
            margin-bottom: 10px;
        }

        .offer-text p {
            font-size: 14px;
            margin-bottom: 20px;
        }

        .offer-text .offer-category {
            font-size: 12px;
            font-weight: bold;
            color: #666;
            display: block;
            margin-bottom: 5px;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #0066ff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
        }

        .offer-image img {
            max-width: 150px;
            border-radius: 10px;
        }

        /* Hide scrollbars on WebKit browsers (e.g., Chrome, Safari) */
        .offers-container::-webkit-scrollbar {
            display: none;
        }

        /* Optional: Customize scrollbar on other browsers */
        .offers-container {
            scrollbar-width: none; /* Firefox */
            -ms-overflow-style: none;  /* IE and Edge */
        }

.card-container {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); /* Creates flexible columns */
    gap: 20px; /* Adds space between the cards */
    padding: 20px;
}

.card {
    background-color: white;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    text-align: center;
    padding: 10px;
}

.card img {
    width: 100%;
    height: auto;
    border-radius: 10px;
}

.card h3 {
    margin: 10px 0 5px;
}

.card p {
    color: gray;
}
        
			
    </style>
</head>
<body>

                        <%
                    
		                    HttpSession session1 = request.getSession(false);
		                    if (session1 != null && session1.getAttribute("username") != null) {
		                        String username = (String) session1.getAttribute("username");
		                        
		                        List<user> uD = ohrsDbUtil.getUserDetails(username);
		                        
		                        if(uD != null && !uD.isEmpty())
		                        {
		                        	for(user u: uD)
		                        	{
		                        		String name = u.getName();
		                        
		                        
		                        
                   	 %>
                   	 
<div>
<div class=h1>

    <header class="header">
        <div class="header-content">
            <div class="imageContainer">
                <img src="css/logo1.jpg">
                
            </div>
            
            <nav class="header-nav">
               <a href="#"></a>
                <a href="user.jsp">User Profile</a>
                <a href="#">My Bookings</a>
                <a href="#">About Us</a>
                <a href="#">FAQ</a>
            </nav>
           
            <div class="header-actions">
               <h3> Welcome<a href="user.jsp#"> <%= name %>! </a></h3> 
            </div>
        </div>
    </header>
        <!-- Hero section with image background -->
	<section class="hero">
        
            <div class="hero-content">
            <div class="no-Class">
                <h2>Find your next stay</h2>
                <p>Search deals on hotels, homes, and much more...</p>
               <form action="searchRoom" method="post">
                <div class="search-container">
                
                
				        <!-- Location input -->
				        <div class="input-group">
				            <span class="icon">🛏</span>
				            <input type="text" name="location" placeholder="Where are you going?" required>
				        </div>
				        
				        <!-- Check-in date input -->
				        <div class="input-group">
				            <span class="icon">📅</span>
				            <input type="date" name="check-in" placeholder="Check-in date" required>
				        </div>
				
				        <!-- Check-out date input -->
				        <div class="input-group">
				            <span class="icon">📅</span>
				            <input type="date" name="check-out" placeholder="Check-out date" required>
				        </div>
				
				        <!-- Room type selection dropdown -->
				        <div class="input-group">
				            <span class="icon">🏨</span>
				            <select name="RoomType" placeholder="Select room type" required >
				                <option value="" disabled selected>Select room type</option>
				                <option value="single">Single</option>
				                <option value="double">Double</option>
				                <option value="suite">Suite</option>
				                <option value="deluxe">Deluxe</option>
				            </select>
				        </div>
				        
				        <div class="input-group">
				        <!-- Search button -->
				        
				        
				        <input type="submit" Value="Search" >
				        </div>
				        
				     
				    </div>
				     </form> 
				</div>    
            </div>
        </section>
    </div>    

	<div class="offers-section">
        <h2>Offers</h2>
        <p>Promotions, deals, and special offers for you</p>
        <div class="offers-container">
            <!-- Offer Card 1 -->
            <div class="offer-card">
                <div class="offer-text">
                    <span class="offer-category">Attractions</span>
                    <h3>Fun things to do for your crew</h3>
                    <p>Bring the team together</p>
                    <a href="#" class="btn">Find attractions</a>
                </div>
                <div class="offer-image">
                    <img src="https://i.pinimg.com/564x/b0/79/1d/b0791d988e2fbae92b502ff4b8ba42ad.jpg" alt="Crew Activity">
                </div>
            </div>

            <!-- Offer Card 2 -->
            <div class="offer-card">
                <div class="offer-text">
                    <h3>Go for a good time, not a long time</h3>
                    <p>Finish your year with a mini break. Save 15% or more when you book and stay by 7 January 2025.</p>
                    <a href="#" class="btn">Find Late Escape Deals</a>
                </div>
                <div class="offer-image">
                    <img src="https://i.pinimg.com/564x/5a/62/22/5a6222c827b34ee49bac0084f2471e1b.jpg" alt="Late Escape">
                </div>
            </div>

            <!-- Offer Card 3 -->
            <div class="offer-card">
                <div class="offer-text">
                    <span class="offer-category">Getaways</span>
                    <h3>Weekend Getaways with Friends</h3>
                    <p>Explore new destinations and have fun.</p>
                    <a href="#" class="btn">Find Weekend Getaways</a>
                </div>
                <div class="offer-image">
                    <img src="https://i.pinimg.com/564x/e9/45/15/e94515ee5fb10fd0f4ed6b4aac725ee9.jpg" alt="Getaway">
                </div>
            </div>

            <!-- Offer Card 4 -->
            <div class="offer-card">
                <div class="offer-text">
                    <span class="offer-category">Family</span>
                    <h3>Family Fun Activities</h3>
                    <p>Enjoy time with the family with special deals.</p>
                    <a href="#" class="btn">Find Family Activities</a>
                </div>
                <div class="offer-image">
                    <img src="https://i.pinimg.com/enabled_lo/564x/39/db/2e/39db2e7a5490c741abcb88208ee1422d.jpg" alt="Family Activity">
                </div>
            </div>
        </div>
	</div>
	
	</div>
        <h2 class="PD">Popular Destination</h2>
        
			<div class="card-container">
			    <div class="card">
			        <img src="https://i.pinimg.com/564x/49/f5/4b/49f54b9954b574e9dca8f5788a656e14.jpg" alt="Nuwara Eliya">
			        <h3>Nuwara Eliya</h3>
			        <p>729 properties</p>
			    </div>
			    <div class="card">
			        <img src="https://i.pinimg.com/564x/28/95/94/28959415856159f64b3a6f98073698b8.jpg" alt="Colombo">
			        <h3>Yala</h3>
			        <p>708 properties</p>
			    </div>
			    <div class="card">
			        <img src="https://i.pinimg.com/564x/cd/56/8f/cd568f465096c34d587ac71db40579d4.jpg" alt="Kandy">
			        <h3>Kandy</h3>
			        <p>1,371 properties</p>
			    </div>
			    <div class="card">
			        <img src="https://i.pinimg.com/564x/7a/fb/18/7afb1867ab39dcc0187ca69d9318d791.jpg" alt="Ella">
			        <h3>Sigiriya</h3>
			        <p>758 properties</p>
			    </div>
			    <div class="card">
			        <img src="https://i.pinimg.com/736x/5b/aa/fc/5baafc6eacc779edddfff338a65c3b06.jpg" alt="Negombo">
			        <h3>Gall fort</h3>
			        <p>763 properties</p>
			    </div>
			  	<div class="card">
			        <img src="https://i.pinimg.com/736x/13/27/f5/1327f548f8d966b78627abca85238600.jpg" alt="Negombo">
			        <h3>Mirissa</h3>
			        <p>763 properties</p>
			    </div>
			    <div class="card">
			        <img src="https://i.pinimg.com/564x/c8/d9/f1/c8d9f17337e8fb03584c35bbf7d2bd1c.jpg" alt="Negombo">
			        <h3>Jaffna</h3>
			        <p>763 properties</p>
			    </div>
			    <div class="card">
			        <img src="https://i.pinimg.com/564x/cb/a7/61/cba7612b3fb0a2a6ba6cc6b2d295443f.jpg" alt="Negombo">
			        <h3>Anuradhapura</h3>
			        <p>763 properties</p>
			    </div>
			    <!-- Repeat cards as needed -->
			</div>
        	
        
		<br>

    <footer class="footer">
        <div class="footer-links">
            <a href="#">Terms and conditions</a>
            <a href="#">Privacy policy</a>
            <a href="#">Help</a>
            <a href="#">Sitemap</a>
        </div>
        <p>© 2024 Booking.com</p>
    </footer>
    
    <%
		                        	}
		                        }
		                    } else {
		                        response.sendRedirect("login.jsp");
		                    }
    %>
</body>
</html>
