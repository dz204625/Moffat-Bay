<%@ page session="true" %>
<%@ page import="model.Reservation, dao.RoomDAO" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Moffat Bay Lodge Rooms</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="icon" type="image/png" sizes="32x32" href="./images/favicon-32x32.png">
</head>

<body>

<!-- Include Header -->
<jsp:include page="header.jsp" />

<section class="wrapper">

<%
    RoomDAO roomDAO = new RoomDAO();
    Reservation r = (Reservation) session.getAttribute("reservation");

    String roomType = "";
    if (r != null) {
        roomType = roomDAO.getRoomById(r.getRoomId()).getRoomType();
    }

    String successMessage = (String) request.getAttribute("successMessage");
    String errorMessage = (String) request.getAttribute("errorMessage");
%>

<h2>Reservation Summary</h2>

<!-- Success / Error Messages -->
<% if (successMessage != null) { %>
    <p class="success-message"><%= successMessage %></p>
<% } %>

<% if (errorMessage != null) { %>
    <p class="error-message"><%= errorMessage %></p>
<% } %>

<!-- Reservation Details -->
<% if (r != null) { %>

    <p><strong>Room Type:</strong> <%= roomType %></p>
    <p><strong>Guests:</strong> <%= r.getNumGuests() %></p>
    <p><strong>Check-In:</strong> <%= r.getCheckInDate() %></p>
    <p><strong>Check-Out:</strong> <%= r.getCheckOutDate() %></p>
    <p><strong>Total Price:</strong> $<%= r.getTotalPrice() %></p>

    <!-- Buttons only show if reservation not yet confirmed -->
    <form action="ConfirmReservationController" method="post" style="display:inline;">
        <button type="submit" class="btn-orange">Confirm</button>
    </form>

    <form action="book.jsp" method="get" style="display:inline;">
        <button type="submit" class="btn-outline">Cancel</button>
    </form>

<% } else if (successMessage != null) { %>

    <p>Your reservation has been successfully completed.</p>
    <a href="index.jsp" class="btn-orange">Back to Home</a>

<% } else { %>

    <p>No reservation found.</p>
    <a href="book.jsp" class="btn-outline">Make a Reservation</a>

<% } %>

</section>

<!-- Include Footer -->
<jsp:include page="footer.jsp" />

</body>
</html>
