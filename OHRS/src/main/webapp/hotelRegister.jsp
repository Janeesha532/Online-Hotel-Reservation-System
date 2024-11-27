<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Registration Form</title>
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

.header h1 {
    font-size: 30px;
    font-weight: bold;
}

.header-content img{

            width: 100px;
            height: 100px;
            padding: 0px;
            margin: -10px;
        }
        
.header-actions {
	padding: 5px 10px;
	border: none;
	border-radius: 3px;
	background-color: #98DED9;
	color: #000000;
}

.container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
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
    background-color: #faedd8;
}

.form-section h2 {
    font-size: 24px;
    color: #1E88E5;
    margin-bottom: 20px;
}

.form-section label {
    display: block;
    margin-bottom: 10px;
    font-weight: bold;
    color: #333333;
}

.form-section input[type="text"],
.form-section input[type="tel"],
.form-section input[type="url"],
.form-section input[type="password"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.add-room-btn {
    background: linear-gradient(135deg, #1E88E5, #64B5F6);
    color: #FFFFFF;
    padding: 10px;
    border: none;
    width: 100%;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.add-room-btn:hover {
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
    height: 100%;
    object-fit: cover;
}

.footer {
    background-color: #2F3645;
    color: #FEFBF6;
    text-align: center;
    padding: 10px 0;
    position: fixed;
    width: 100%;
    bottom: 0;
}

    </style>
    
</head>
<body>
    <div class="header">
        <div class="header-content">
			<div>
                <img src="css/logo1.jpg">
            </div>    
            <div class="header-action">
				<a href="login.jsp"><button class="header-actions">Sign in</button></a>
			</div>	
        </div>
    </div>

    <div class="container">
        <div class="form-wrapper">
            <div class="form-section">
                <h2>Register Your Hotel</h2>
                <form action="hInsert" method="post">
                    <label for="hotel-name">Hotel Name:</label>
                    <input type="text" id="hotel-name" name="hotelName" placeholder="Enter hotel name" required>

                    <label for="hotel-location">Hotel Location:</label>
                    <input type="text" id="hotel-location" name="hotelLocation" placeholder="Enter hotel location" required>

                    <label for="contact-number">Contact Number:</label>
                    <input type="tel" id="contact-number" name="contactNumber" placeholder="Enter contact number"  required>
                    
                    <label for="hotel_image">Add Images:</label>
                    <input type="url" id="image" name="hImage" placeholder="Enter URL" required>

				<h2>Manager Details</h2>
				
                    <label for="manager-username">Manager Username:</label>
                    <input type="text" id="manager-username" name="managerUsername" placeholder="Enter manager username" required>

                    <label for="manager-password">Manager Password:</label>
                    <input type="password" id="manager-password" name="managerPassword" placeholder="Enter manager password" required>

                    <input type="submit" class="add-room-btn"  value="Register Hotel">
                </form>
            </div>

            <div class="image-section">
                <img src="https://i.pinimg.com/564x/ab/24/8b/ab248b16405184c7acd0e4ff5b010fad.jpg" alt="Hotel Image"> <!-- Use a relevant image here -->
            </div>
        </div>
    </div>

    <div class="footer">
        <p>© 2024 Hotel Management System</p>
    </div>
</body>
</html>