<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register - StayMaster</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #FEFBF6;
	color: #B67352;
	display: flex;
	flex-direction: column;
	min-height: 100vh; /* Ensures the body fills the full height */
}

.header {
	background-color: #2F3645;
	color: #FEFBF6;
	padding: 10px 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 100%;
}

.header-content {
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
	font-size: 24px;
	font-weight: bold;
}



.header-actions {
	padding: 5px 10px;
	border: none;
	border-radius: 3px;
	background-color: #98DED9;
	color: #000000;
}

.main-content {
	flex: 1;
	padding: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: calc(100vh - 120px); /* Leave space for the footer */
}

.register-section {
	width: 100%;
	max-width: 1200px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.register-container {
	display: flex;
	flex-direction: row;
	width: 100%;
	max-width: 1000px;
	min-height: 70vh;
	background-color: #FEFBF6;
	border: 1px solid #ccc;
	border-radius: 8px;
	overflow: hidden;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.image-container {
	flex-basis: 40%;
	/* Ensures the image takes up a reasonable amount of space */
}

.image-container img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.form-container {
	flex: 1;
	padding: 40px;
	display: flex;
	flex-direction: column;
	justify-content: center;
}

h2 {
	font-size: 24px;
	color: #B67352;
	margin-bottom: 20px;
}

.form-group {
	margin-bottom: 15px;
}

.form-group label {
	display: block;
	font-size: 14px;
	color: #B67352;
	margin-bottom: 5px;
}

.form-group input, .form-group select {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 16px;
	color: #2F3645;
}

.submit-button {
	width: 100%;
	padding: 10px;
	border: none;
	border-radius: 4px;
	background-color: #ECB159;
	color: #fff;
	font-size: 16px;
	cursor: pointer;
}

.submit-button:hover {
	background-color: #B67352;
}

.footer {
	background-color: #2F3645;
	color: #FEFBF6;
	text-align: center;
	padding: 5px 0; /* Smaller padding for the footer */
	width: 100%;
}

.footer-links {
	display: flex;
	justify-content: center;
	gap: 15px;
	font-size: 12px; /* Smaller font for footer links */
}

.footer-links a {
	color: #FEFBF6;
	text-decoration: none;
}

.footer p {
	font-size: 12px;
}
</style>
</head>
<body>
	<header class="header">
		<div class="header-content">
			<div>
                <img src="css/logo1.jpg">
            </div>    
            <div class="header-action">
				<a href="login.jsp"><button class="header-actions">Sign in</button></a>
			</div>	
		</div>
	</header>

	<main class="main-content">
		<section class="register-section">
			<div class="register-container">
				<div class="image-container">
					<img src="https://i.pinimg.com/474x/5e/69/ba/5e69ba26282a2a2ee53d5257d56cf3d1.jpg" alt="Registration Image">
				</div>
				<div class="form-container">
					<h2>Create Your Account</h2>

					<form class="register-form" method= "POST" action= "insertUser">

						<div class="form-group">
							 <input type="hidden" id="id" name="id" readonly>
						</div>

						<div class="form-group">
							<label for="name">Full Name</label> <input type="text" id="name" name="name" required>
						</div>
						
						<div class="form-group">
							<label for="email">Email</label> <input type="email" id="email" name="email" required>
						</div>
						<div class="form-group">
							<label for="address">Address</label> <input type="text" id="address" name="address" required>
						</div>
						<div class="form-group">
							<label for="contact-number">Contact Number</label> <input
								type="tel" id="contact-number" name="contactnumber" required>
						</div>
						<div class="form-group">
							<label for="birth-date">Birth Date</label> <input type="date" id="birth-date" name="birthdate" required>
						</div>
						<div class="form-group">
							<label for="password">Password</label> <input type="password" id="password" name="password" required>
						</div>
						<div class="form-group">
							<label for="confirm-password">Confirm Password</label> <input
								type="password" id="confirm-password" name="confirm-password"
								required>
						</div>
						<input type="submit" value="Register" class="submit-button">
					</form>
				</div>
			</div>
		</section>
	</main>

	<footer class="footer">
		<div class="footer-links">
			<a href="#">Terms and conditions</a> <a href="#">Privacy policy</a> <a
				href="#">Help</a> <a href="#">Sitemap</a>
		</div>
		<p>© 2024 StayMaster</p>
	</footer>
</body>
</html>