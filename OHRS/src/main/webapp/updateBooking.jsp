<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modify Your Booking</title>
    
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
            display: flex;
            justify-content: center;
            align-items: center;
            height: 185vh;
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
        .form-group input[type="date"],
        .form-group input[type="number"],
        .form-group input[type="tel"],
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            margin-bottom: 15px;
            color: #333;
            background-color: #FAEDD8;
        }

        button[type="submit"],
        button[type="button"] {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #1E88E5, #64B5F6);
            color: #FFFFFF;
            font-size: 18px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-bottom: 10px; /* Space between buttons */
        }

        button[type="submit"]:hover,
        button[type="button"]:hover {
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
            height: 188vh;   /* Ensures uniform height for all images */
            object-fit: cover;
            margin-bottom: 10px; /* Adds spacing between images */
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
	
	HttpSession session1 = request.getSession(false);
    if (session1 != null && session1.getAttribute("username") != null) {
        String username = (String) session1.getAttribute("username");
        
	 //String bId = request.getParameter("bookId");
	 String bookId = request.getParameter("bookId");
	 String name = request.getParameter("name");
	 String email = request.getParameter("email");
	 String checkin = request.getParameter("checkin");
	 String checkout = request.getParameter("checkout");
	 String roomtype = request.getParameter("roomtype");
	 String guests = request.getParameter("guests");
	 String board = request.getParameter("board");
	 String note = request.getParameter("note");
	 String contact = request.getParameter("contact");
	 String payment = request.getParameter("payment");
	%>

<div class="form-wrapper">
    <div class="form-section">
        <h1>Modify Your Booking</h1>
        <form action="bookingUpdateServlet" method="POST" id="updateForm">
            <div class="form-group">
              
				<input type = "hidden" name="bookId" value="<%= bookId %>" readonly>              
              
                <label for="name">Full Name:</label>
                <input type="text" id="name" name="name" value ="<%= name %>">
            </div>
            
            <div class="form-group">
                <label for="email">Email Address:</label>
                <input type="email" id="email" name="email" value = "<%= email %>">
            </div>

            <div class="form-group">
                <label for="checkin">Check-in Date:</label>
                <input type="date" id="checkin" name="checkin" value=<%= checkin %>>
            </div>

            <div class="form-group">
                <label for="checkout">Check-out Date:</label>
                <input type="date" id="checkout" name="checkout" value =<%= checkout %>>
            </div>

            <div class="form-group">
                <label for="roomtype">Room Type:</label>
                <select id="roomtype" name="roomtype" required>
                    <option value="" disabled selected>Select room type</option>
                    <option value="single" <%= "single".equals(roomtype) ? "selected" : "" %>>Single</option>
                    <option value="double" <%= "double".equals(roomtype) ? "selected" : "" %>>Double</option>
                    <option value="suite" <%= "suite".equals(roomtype) ? "selected" : "" %>>Suite</option>
                    <option value="deluxe" <%= "deluxe".equals(roomtype) ? "selected" : "" %>>Deluxe</option>
                </select>
            </div>

            <div class="form-group">
                <label for="guests">Number of Guests:</label>
                <input type="number" id="guests" name="guests" min="1" value ="<%= guests %>">
            </div>

            <div class="form-group">
                <label for="board">Board Type:</label>
                <select id="board" name="board">
                    <option value="" disabled selected>Select board type</option>
                    <option value="full" <%= "full".equals(board) ? "selected" : "" %>>Full</option>
                    <option value="half" <%= "half".equals(board) ? "selected" : "" %>>Half</option>
                </select>
            </div>

            <div class="form-group">
                <label for="note">Additional Notes:</label>
                <textarea id="note" name="note" rows="4" placeholder=<%= note%>></textarea>
            </div>

            <div class="form-group">
                <label for="contact">Contact Number:</label>
                <input type="tel" id="contact" name="contact" value="<%= contact %>">
            </div>

            <div class="form-group">
                <label for="payment">Payment Method:</label>
                <select id="payment" name="payment" required>
                    <option value="creditcard" <%= "creditcard".equals(payment) ? "selected" : "" %>>Credit Card</option>
                    <option value="debitcard" <%= "debitcard".equals(payment) ? "selected" : "" %>>Debit Card</option>
                    <option value="paypal" <%= "paypal".equals(payment) ? "selected" : "" %>>PayPal</option>
                    <option value="cash" <%= "cash".equals(payment) ? "selected" : "" %>>Cash</option>
                </select>
            </div>

            <div class="form-group">
                <button type="submit">Save Changes</button>
                <button type="button" id="clearButton" onclick="clearForm()">Clear</button>
            </div>
        </form>
    </div>

    <div class="image-section">
        
        <img src="https://i.pinimg.com/236x/a6/60/82/a660822e9711fcc210c5fdfa9615a494.jpg" alt="Hotel image2">
        
    </div>
</div>
<%
    } else {
        response.sendRedirect("login.jsp");
    }

%>
</body>
</html>
