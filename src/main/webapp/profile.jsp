<%@ page import="dao.ReservationDAO, dao.CustomerDAO, model.Reservation, dao.RoomDAO, model.Room,java.util.List" %>
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
    CustomerDAO customerDAO = new CustomerDAO();
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
            <% if (reservations != null && !reservations.isEmpty()) { %>
                <h3 style="margin:20px 0;">Existing Reservations:</h3>

                <% for (Reservation res : reservations) { %>
                    <div style="
                        background-color:#f5f1e6;
                        border:1px solid #e0d6b8;
                        border-radius:10px;
                        padding:18px;
                        margin-bottom:20px;
                        box-shadow:0 4px 8px rgba(0,0,0,0.08);
                    ">
                        <table style="width:100%; border-collapse:collapse;">
                            <tr>
                                <td style="font-weight:bold; padding:8px; width:35%;">Reservation Number</td>
                                <td style="padding:8px;"><%= res.getReservationId() %></td>
                            </tr>
                            <tr>
                                <td style="font-weight:bold; padding:8px;">Guest Name</td>
                                <td style="padding:8px;">
                                    <%= customerDAO.getCustomerFullNameById(res.getCustomerId()) %>
                                </td>
                            </tr>
                            <tr>
                                <td style="font-weight:bold; padding:8px;">Room Type</td>
                                <td style="padding:8px;">
                                    <%= roomDAO.getRoomById(res.getRoomId()).getRoomType() %>
                                </td>
                            </tr>
                            <tr>
                                <td style="font-weight:bold; padding:8px;">Number of Guests</td>
                                <td style="padding:8px;"><%= res.getNumGuests() %></td>
                            </tr>
                            <tr>
                                <td style="font-weight:bold; padding:8px;">Check-in Date</td>
                                <td style="padding:8px;"><%= res.getCheckInDate() %></td>
                            </tr>
                            <tr>
                                <td style="font-weight:bold; padding:8px;">Check-out Date</td>
                                <td style="padding:8px;"><%= res.getCheckOutDate() %></td>
                            </tr>
                            <tr>
                                <td style="font-weight:bold; padding:8px;">Total Price</td>
                                <td style="padding:8px; font-weight:bold; color:#6b4f1d;">
                                    $<%= res.getTotalPrice() %>
                                </td>
                            </tr>
                        </table>
                    </div>
                <% } %>
            <% } else if (searched) { %>
                <p style="color:#a94442; font-weight:bold; margin-top:20px;">
                    No reservations found matching your search.
                </p>
            <% } %>
</section>
<!-- Include Footer -->
    <jsp:include page="footer.jsp" />

</body>
</html>