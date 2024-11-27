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
    
    <script>
        // Function to clear the form fields
        function clearForm() {
            document.getElementById("updateForm").reset();
        }
    </script>
       
</head>
<body>
    <%
    HttpSession session1 = request.getSession(false);  // Ensure correct session handling
    if (session1 != null && session1.getAttribute("username") != null) {
        String username = (String) session.getAttribute("username");
        
        List<user> uD = ohrsDbUtil.getUserDetails(username);
        if (uD != null && !uD.isEmpty()) {
            for (user u : uD) {
                
                List<Payment> PD = ohrsDbUtil.readPayment(u.getUser_id());
                if (PD != null && !PD.isEmpty()) {
                    for (Payment p : PD) {
    %>

    <div class="form-wrapper">
        <div class="form-section">
            <h1>Payment Details</h1>
            <form action="paymentUpdateServlet" id="updateForm" method="POST">
                <div class="form-group">
                
                <input type="hidden" name="paymentId" value="<%= p.getPaymentId() %>" readonly>
                <input type="hidden" name="userId" value="<%= u.getUser_id() %>" readonly>
                
                    <label for="name">Full Name:</label>
                    <input type="text" id="name" name="name" value="<%= p.getFullName() %>" required>
                </div>

                <div class="form-group">
                    <label for="email">Email Address:</label>
                    <input type="email" id="email" name="email" value="<%= p.getEmail() %>" required>
                </div>

                <div class="form-group">
                    <label for="card-type">Card Type:</label>
                    <select id="card-type" name="cardtype" required>
                        <option value="" disabled selected>Select card type</option>
                        <option value="visa" <%= "visa".equals(p.getCardType()) ? "selected='selected'" : "" %> >Visa</option>
                        <option value="mastercard" <%= "mastercard".equals(p.getCardType()) ? "selected='selected'" : "" %>>MasterCard</option>
                        <option value="paypal" <%= "paypal".equals(p.getCardType()) ? "selected='selected'" : "" %>>PayPal</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="card-number">Card Number:</label>
                    <input type="text" id="card-number" name="cardnumber" value="<%= p.getCardNumber() %>" required>
                </div>

                <div class="form-group">
                    <label for="expiry-date">Expiry Date (MM/YY):</label>
                    <input type="text" id="expiry-date" name="expirydate" value="<%= p.getExpiryDate() %>" required>
                </div>

                <div class="form-group">
                    <label for="cvc">CVC:</label>
                    <input type="text" id="cvc" name="cvc" value="<%= p.getCVC() %>" required>
                </div>

                <div class="form-group">
                    <label for="amount">Total Amount:</label>
                    <input type="number" id="amount" name="amount" value="<%= p.getTotalAmount() %>" required>
                </div>

                <!-- Submit and Clear Buttons -->
                <div class="form-group">
                    <button type="submit">Save Changes</button>
                    <button type="button" onclick="clearForm()">Clear</button>
                </div>
            </form>
        </div>

        <div class="image-section">
            <img src="https://i.pinimg.com/236x/5d/f9/66/5df96623ccfa802194820a0c16b24061.jpg" alt="Payment Image">
            <img src="https://i.pinimg.com/736x/1a/26/5f/1a265f6dc08971475e6b3b07e97a5f27.jpg" alt="Payment Image">
        </div>
    </div>
  
    <%
                    }  // Closing Payment loop
                }  // End of checking Payment list
            }  // Closing user loop
        } else {
            response.sendRedirect("login.jsp");
        }
    } else {
        response.sendRedirect("login.jsp");
    }
    %>
</body>
</html>
