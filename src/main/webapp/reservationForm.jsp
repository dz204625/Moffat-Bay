<%@ page import="dao.RoomDAO, model.Room, java.util.List" %>
<%@ page session="true" %>

<%
	 if (session.getAttribute("user") == null) {
	        response.sendRedirect("login.jsp?msg=Please login first");
	        return;
	 }
   Integer roomId = null;

   try {
       if (request.getParameter("roomId") != null) {
           roomId = Integer.parseInt(request.getParameter("roomId"));
       }
   } catch (Exception e) {
       roomId = null;
   }	
	%>
	<section>
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