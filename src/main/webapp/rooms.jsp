<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.RoomDAO, model.Room, java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Moffat Bay Lodge Rooms</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <!-- Include Header -->
    <jsp:include page="header.jsp" />
     
    <section>   
    <%
	    RoomDAO dao = new RoomDAO();
	    List<Room> rooms = dao.getAllRooms();
	%>

		<div class="room-list">
		<h2>Our Rooms</h2>
		    <%
		        if (rooms != null && !rooms.isEmpty()) {
		            for (Room room : rooms) {
		                request.setAttribute("room", room);   // Pass room to child JSP
		    %>
		
		                <jsp:include page="room.jsp" />
		
		    <%
		            }
		        } else {
		    %>
		
		        <p>No rooms available at this time.</p>
		
		    <%
		        }
		    %>
		</div>

     
     </section>


    <!-- Include CTA Section -->
    <jsp:include page="cta.jsp" />

    <!-- Include Footer -->
    <jsp:include page="footer.jsp" />

</body>
</html>