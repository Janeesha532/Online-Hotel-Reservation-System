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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Room Insert Successful</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/success.css">
</head>
<body>

<%
			HttpSession session1 = request.getSession(false);
			if (session1 != null && session1.getAttribute("username") != null) {
			    String username = (String) session1.getAttribute("username");
    
	
            	  
            		  
           				
           
								
%>

    <div class="container">
        <div class="message-box">
        
        
            <h1>Booking Successful!</h1>
            <p>Your booking has been successfully placed.</p>
            
       
            <a href="paymentInsert.jsp"><input type="submit" class="button" value="Pay Now"></a>
              
          
        </div>
    </div>

    
    <%
			
			
	
              } else {
                  response.sendRedirect("login.jsp");
              }
%>
    
   
</body>
</html>
