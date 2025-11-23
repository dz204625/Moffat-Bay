<%@ page import="dao.ReservationDAO, model.Reservation, dao.RoomDAO, model.Room,java.util.List" %>
<%@ page session="true" %>

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

<%
	RoomDAO roomDAO = new RoomDAO();
    ReservationDAO dao = new ReservationDAO();
    String firstName = (String) session.getAttribute("customerFirstName");
    String lastName = (String) session.getAttribute("customerLastName");
    String phone = (String) session.getAttribute("phone");
	String email = (String) session.getAttribute("customerEmail");

	boolean searched = request.getParameter("search") != null;

	List<Reservation> reservations = null;

	if(email == null) {
		reservations = (List<Reservation>) request.getAttribute("reservations");
	
	} else {
		reservations = dao.findReservationByIdOrEmail(email);
	}
%>

	<section class="wrapper">

	<% if (!searched || email != null) { %>
		<h2>Profile</h2>
	    	<p>Name: <%= firstName + " " + lastName %></p>
	    	<p>Phone: <%=phone %></p>
	    	<p>Email: <%=email %></p>
	    	<hr>
	<% } %>

	<!-- Include reservation -->
	<jsp:include page="reservationForm.jsp" />
	
	<% if (reservations != null && !reservations.isEmpty()) { %>
		<h3>Reservation Results:</h3>
	
	    <% for (Reservation res : reservations) { %>
	        <div style="border:1px solid #ccc; padding:15px; margin-bottom:15px; border-radius:8px;">
	            <h4>Reservation Number:<%= res.getReservationId() %></h4>
	            <p>
	                This reservation is for a 
	                <strong><%=roomDAO.getRoomById(res.getRoomId()).getRoomType() %></strong> room,
	                booked for <strong><%= res.getNumGuests() %></strong> guest(s).
	            </p>
	            <p>
	                The stay begins on <strong><%= res.getCheckInDate() %></strong> 
	                and ends on <strong><%= res.getCheckOutDate() %></strong>.
	            </p>
	            <p>
	                The total cost of this reservation is 
	                <strong>$<%= res.getTotalPrice() %></strong>.
	            </p>
	        </div>
	    <% } %>
	
	<% } else if (searched) { %>
	    <p>No reservations found matching your search.</p>
	<% } %>
</section>
<!-- Include Footer -->
    <jsp:include page="footer.jsp" />

</body>
</html>

