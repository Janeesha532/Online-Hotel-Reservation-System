<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/jpg" href="css/logo1.jpg"> 
    <title>StayMaster - Login</title>
    
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #FEFBF6;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            position: relative;
        }

        .background-blur {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-image: url('https://i.pinimg.com/564x/b4/2d/a1/b42da1cb90f4d8f8db75073baada166c.jpg');
            /*background-image: url('css/loginimg.jpg');*/
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            filter: blur(5px); /* Increased blur for more contrast */
            z-index: -1;
        }

        .login-container {
            background-color: rgba(255, 255, 255, 0.85); /* Lighter background for contrast */
            padding: 40px;
            border-radius: 15px;
            width: 350px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .login-container h2 {
            color: #333;
            margin-bottom: 30px;
            font-size: 28px;
        }

        .input-group {
            margin-bottom: 20px;
            text-align: left;
        }

        .input-group label {
            display: block;
            margin-bottom: 5px;
            color: #333;
            font-weight: bold;
        }

        .input-group input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 10px; /* Softer rounded edges */
            font-size: 16px;
            background-color: #f9f9f9; /* Light background for input fields */
        }

        .input-group input:focus {
            border-color: #ECB159; /* Highlight color on focus */
            outline: none;
        }

        .login-button {
            width: 100%; /* Full width for button */
            padding: 12px;
            background-color: #ECB159;
            color: #fff;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-bottom: 20px;
        }

        .login-button:hover {
            background-color: #B67352;
        }

        .forgot-password {
            margin-bottom: 20px;
        }

        .forgot-password a {
            color: #B67352;
            text-decoration: none;
            font-size: 14px;
        }

        .forgot-password a:hover {
            text-decoration: underline;
        }

        .signup-link {
            margin-top: 20px;
            font-size: 14px;
        }

        .signup-link a {
            color: #ECB159;
            text-decoration: none;
            font-weight: bold;
        }

        .signup-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="background-blur"></div> <!-- Background with blur effect -->

    <div class="login-container">
        <h2>Login to StayMaster</h2>
        
        <form action="rlogin" method="post">
            <div class="input-group">
                <label for="email">Email</label>
                <input type="text" id="email" name="username" placeholder="Enter your username/email" required>
            </div>
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>
            <input type="submit" class="login-button" value="Login">
        </form>

        <div class="forgot-password">
            <a href="#">Forgot your password?</a>
        </div>

        <div class="signup-link">
            Don't have an account? <a href="userRegister.jsp">Sign up now</a><br>
            Are you a hotel owner? <a href="hotelRegister.jsp">Register Your Hotel Now</a>
        </div>
    </div>
</body>
</html>
