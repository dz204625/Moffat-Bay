<%@ page import="dao.ReservationDAO, model.Reservation, java.util.List" %>

<%@ include file="header.jsp" %>
<%@ page session="true" %>


<%
    ReservationDAO dao = new ReservationDAO();
String email = (String) session.getAttribute("customerEmail");
   

    // FIXED — pass the variable directly
    List<Reservation> reservations = dao.findReservationByIdOrEmail(email);

    boolean searched = request.getParameter("search") != null;
%>


<h3>Reservation Results:</h3>
<p><%=email %></p>


<h3>Reservation Results:</h3>

<% if (reservations != null && !reservations.isEmpty()) { %>

    <% for (Reservation res : reservations) { %>
        <div style="border:1px solid #ccc; padding:15px; margin-bottom:15px; border-radius:8px;">
            <h4>Reservation #<%= res.getReservationId() %></h4>

            <p>
                This reservation is for a 
                <strong><%= res.getRoomType() %></strong> room,
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



