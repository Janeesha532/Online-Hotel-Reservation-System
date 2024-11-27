<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ page import = "DAO.ohrsDbUtil" %>
    <%@ page import = "java.util.List" %>
    <%@ page import = "model.user" %>
    <%@ page import = "model.Customer" %>
    <%@ page import = "model.Payment" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Details</title>
    <style>
        /* Global Reset */
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
            height: 200vh; /* Adjust for full viewport height */
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
        .form-group input[type="number"],
        .form-group input[type="tel"],
        .form-group select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            margin-bottom: 15px;
            color: #333;
            background-color: #FAEDD8;
        }

        button[type="submit"], button[type="button"] {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #1E88E5, #64B5F6);
            color: #FFFFFF;
            font-size: 18px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-bottom: 10px; /* Add spacing between buttons */
        }

        button[type="submit"]:hover, button[type="button"]:hover {
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
		                        
		                        List<user> uid = ohrsDbUtil.getUserDetails(username);
		                        if(uid != null && !uid.isEmpty())
		                        {
		                      
		                            user u = uid.get(0); // Assuming you want the first user
		                            int uuid = u.getUser_id();
		                            pageContext.setAttribute("uuid", uuid);
    	
		                        
		                        
                   	 %>

    <div class="form-wrapper">
        <div class="form-section">
            <h1>Payment Details</h1>
            
            
         <form action="paymentInsertionServlet" method="post">
         
            <input type="hidden" name="user_id" value="${uuid}" placeholder="Enter amount" readonly>
                <div class="form-group">
                    <label for="name">Full Name:</label>
                    <input type="text" id="name" name="name" placeholder="enter your name" required>
                </div>

                <div class="form-group">
                    <label for="email">Email Address:</label>
                    <input type="email" id="email" name="email" placeholder="enter your email" required>
                </div>

                <div class="form-group">
                    <label for="card-type">Card Type:</label>
                    <select id="card-type" name="cardtype" required>
                        <option value="" disabled selected>Select card type</option>
                        <option value="visa">Visa</option>
                        <option value="mastercard">MasterCard</option>
                        <option value="paypal">PayPal</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="card-number">Card Number:</label>
                    <input type="text" id="card-number" name="cardnumber" placeholder="1234 5678 9123 4567" required>
                </div>

                <div class="form-group">
                    <label for="expiry-date">Expiry Date (MM/YY):</label>
                    <input type="date" id="expiry-date" name="expirydate" placeholder="MM/YY" required>
                </div>

                <div class="form-group">
                    <label for="cvc">CVC:</label>
                    <input type="text" id="cvc" name="cvc" placeholder="123" required>
                </div>

                <div class="form-group">
                    <label for="amount">Total Amount:</label>
                    <input type="text" id="amount" name="amount" placeholder="Enter amount" required>
                </div>
					
					
                <!-- Submit and Save Buttons -->
                	<div class="form-group">
                  
                    <button type="submit">Save Details</button>
                </div>
            </form>
        </div>

        <div class="image-section">
            <img src="https://i.pinimg.com/236x/5d/f9/66/5df96623ccfa802194820a0c16b24061.jpg" alt="Payment Image">
            <img src="https://i.pinimg.com/736x/1a/26/5f/1a265f6dc08971475e6b3b07e97a5f27.jpg" alt="Payment Image">
        </div>
    </div>
  
   <!-- <script>
        function saveDetails() {
            // Logic to save details without submitting the form
            alert('Details saved successfully!');
        }
    </script> -->


	<%				
	
		                        }else{
		                        	response.sendRedirect("success/unsuccess.jsp");
		                        }     	

		                        
		                    } else {
		                        response.sendRedirect("login.jsp");
		                    }
	%>
</body>
</html>
