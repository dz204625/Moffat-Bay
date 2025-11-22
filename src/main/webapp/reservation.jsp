<%@ page import="dao.RoomDAO, model.Room, java.util.List" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Moffat Bay Lodge Rooms</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="icon" type="image/png" sizes="32x32" href="./images/favicon-32x32.png">
</head>
<body>

    <!-- Include Header -->
    <jsp:include page="header.jsp" />
   
	<section class="wrapper">
	
<%
	 if (session.getAttribute("user") == null) {
	        response.sendRedirect("login.jsp?msg=Please login first");
	        return;
	 }
   Integer roomId = null;
   String firstName = (String) session.getAttribute("customerFirstName");
   String lastName = (String) session.getAttribute("customerLastName");
   String phone = (String) session.getAttribute("phone");
   String email = (String) session.getAttribute("customerEmail");

   try {
       if (request.getParameter("roomId") != null) {
           roomId = Integer.parseInt(request.getParameter("roomId"));
       }
   } catch (Exception e) {
       roomId = null;
   }	
	%>
	<section>
		<h2>Profile</h2>
	    	<p>Name: <%= firstName + " " + lastName %></p>
	    	<p>Phone: <%=phone %></p>
	    	<p>Email: <%=email %></p>
	    	<hr>
	    <h2>Book Your Vacation</h2>
		<form action="ReservationController" method="post">
			<label>Room Type:</label><br>
			<select name="roomId" required>
			    <option value="1" <% if (roomId != null && roomId == 1) { %> selected <% } %>>
			    Double Full Beds - $126.00/night
				</option>
				<option value="2" <% if (roomId != null && roomId == 2) { %> selected <% } %>>
				    Queen - $141.75/night
				</option>
				<option value="3" <% if (roomId != null && roomId == 3) { %> selected <% } %>>
				    Double Queen Beds - $157.50/night
				</option>
				<option value="4" <% if (roomId != null && roomId == 4) { %> selected <% } %>>
				    King - $168.00/night
				</option>
			</select>
			<br><br>
		    <label>Number of Guests:</label><br>
		    <input type="number" name="numGuests" min="1" max="6" required><br><br>
		    <label>Check-In Date:</label><br>
		    <input type="date" name="checkInDate" required><br><br>
		    <label>Check-Out Date:</label><br>
		    <input type="date" name="checkOutDate" required><br><br>
	
		    <button type="submit" class="btn-orange">Continue to Summary</button>	
		</form>
	</section>
	</section>

    <!-- Include Footer -->
    <jsp:include page="footer.jsp" />

</body>
</html>