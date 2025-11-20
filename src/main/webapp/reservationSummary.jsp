<%@ page session="true" %>
<%@ page import="model.Reservation" %>

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
<p><strong>Nights:</strong> <%= r.getNights() %></p>
<p><strong>Total Price:</strong> $<%= r.getTotalPrice() %></p>

<form action="ConfirmReservationController" method="post" style="display:inline;">
    <button type="submit">Confirm</button>
</form>

<form action="reservation.jsp" method="get" style="display:inline;">
    <button type="submit">Cancel</button>
</form>
