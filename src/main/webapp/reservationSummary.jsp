<%@ page session="true" %>
<%@ page import="model.Reservation" %>

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
		    Reservation r = (Reservation) session.getAttribute("reservation");
		
		    if (r == null) {
		        response.sendRedirect("reservation.jsp");
		        return;
		    }
		%>
		
		<h2>Reservation Summary</h2>
		
		<p><strong>Room:</strong> <%= r.getRoomId() %></p>
		<p><strong>Guests:</strong> <%= r.getNumGuests() %></p>
		<p><strong>Check-In:</strong> <%= r.getCheckInDate() %></p>
		<p><strong>Check-Out:</strong> <%= r.getCheckOutDate() %></p>
		<p><strong>Total Price:</strong> $<%= r.getTotalPrice() %></p>
		
		<form action="ConfirmReservationController" method="post" style="display:inline;">
		    <button type="submit" class="btn-orange">Confirm</button>
		</form>
		
		<form action="reservation.jsp" method="get" style="display:inline;">
		    <button type="submit" class="btn-outline">Cancel</button>
		</form>
	</section>
	
	<!-- Include Footer -->
    <jsp:include page="footer.jsp" />

</body>
</html>
	